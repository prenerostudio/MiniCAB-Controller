<?php
include('../../../config.php');
include('../../../session.php');

if (isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];
    $pl_number = $_POST['pl_number'];
    $pl_exp = $_POST['pl_exp'];
	
    $pl_exp_time = $_POST['pl_exp_time'];
	
    $date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS
    $targetDir = "../../../img/drivers/pco-license/";
    $fileExtension = strtolower(pathinfo($_FILES["pco"]["name"], PATHINFO_EXTENSION));
    $allowedExtensions = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];
    if (!in_array($fileExtension, $allowedExtensions)) {
        echo "Invalid file type.";
        header("Location: ../../../view-driver.php?d_id=$d_id#tabs-document");
        exit;
        }           
        $uniqueId = uniqid();    
        $fileName = $uniqueId . "." . $fileExtension;    
        $targetFilePath = $targetDir . $fileName;           
        if (move_uploaded_file($_FILES["pco"]["tmp_name"], $targetFilePath)) {
            try {                           
                $stmt = $connect->prepare("SELECT * FROM `pco_license` WHERE `d_id` = ?");            
                $stmt->bind_param("s", $d_id);            
                $stmt->execute();            
                $result = $stmt->get_result();                           
                if ($result->num_rows > 0) {                                   
                    $updateStmt = $connect->prepare("UPDATE `pco_license` SET 
									`pl_number`= ?,
									`pl_exp`= ?,
									`pl_exp_time`= ?,
									`pl_img`= ?,
									`pl_updated_at`= ? WHERE `d_id` = ?");
                    $updateStmt->bind_param("ssssss", $pl_number, $pl_exp, $pl_exp_time, $fileName, $date_update, $d_id);                
                    if ($updateStmt->execute()) {
                        logActivity('PCO License Updated', $d_id, "PCO License of Driver $d_id has been updated by Controller.");                                                                                    
                    } else {                    
                        echo "Database update failed.";                                        
                    }                                
                    } else {                                
                        $insertStmt = $connect->prepare("INSERT INTO `pco_license`(`d_id`, `pl_number`, `pl_exp`, `pl_exp_time`, `pl_img`, `pl_created_at`)  VALUES (?, ?, ?, ?, ?, ?)");                
                        $insertStmt->bind_param("ssssss", $d_id, $pl_number, $pl_exp, $pl_exp_time, $fileName, $date_update);                
                        if ($insertStmt->execute()) {                    
                            logActivity('PCO License Added', $d_id, "PCO License of Driver $d_id has been added by Controller.");                                                                                                
                        } else {                    
                            echo "Database insertion failed.";                                            
                        }                                    
                        }                                              
                        header("Location: ../../../view-driver.php?d_id=$d_id#tabs-document");                                
                        } catch (Exception $e) {                        
                            echo "An error occurred: " . $e->getMessage();                                    
                        }            
                        } else {        
                            echo "File upload failed, please try again.";        
                            header("Location: ../../../view-driver.php?d_id=$d_id#tabs-document");                                
                        }                       
                        }
                        function logActivity($activityType, $driverId, $details) {    
                            global $connect, $myId;    
                            $activityStmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");    
                            $userType = 'user';    
                            $activityStmt->bind_param("ssss", $activityType, $userType, $myId, $details);    
                            $activityStmt->execute();                           
                        }
?>