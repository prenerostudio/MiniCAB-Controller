<?php
include('config.php');
include('session.php');
if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];
    $targetDir = "img/drivers/address-proof/";
    $fileExtension = strtolower(pathinfo($_FILES["pa1"]["name"], PATHINFO_EXTENSION));
    $fileExtension1 = strtolower(pathinfo($_FILES["pa2"]["name"], PATHINFO_EXTENSION));    
    $date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS    
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    $uniqueId = uniqid();  
    $pa1 = $uniqueId . "." . $fileExtension; 
    $pa2 = $uniqueId . "." . $fileExtension1; 
    $targetFilePath = $targetDir . $pa1;
    $targetFilePath1 = $targetDir . $pa2;    
    if (in_array($fileExtension, $allowTypes)) {												    
        if (move_uploaded_file($_FILES["pa1"]["tmp_name"], $targetFilePath)) {                     
            try {                                       
                $stmt = $connect->prepare("SELECT * FROM `address_proofs` WHERE `d_id` = ?");                            
                $stmt->bind_param("s", $d_id);                            
                $stmt->execute();                            
                $result = $stmt->get_result();                                           
                if ($result->num_rows > 0) {                                                   
                    $updateStmt = $connect->prepare("UPDATE `address_proofs` SET `ap_1`= ?,`ap_2`= ?,`ap_updated_at`= ? WHERE `d_id` = ?");                    
                    $updateStmt->bind_param("ssss", $pa1, $pa2, $date_update, $d_id);                                    
                    if ($updateStmt->execute()) {                    
                        logActivity('Address Proof Updated', $d_id, "Address Proof of Driver $d_id has been updated by Controller.");
                    } else {
                        echo "Database update failed.";
                    }
                    } else {
                        $insertStmt = $connect->prepare("INSERT INTO `address_proofs`(`d_id`, `ap_1`, `ap_2`, `ap_created_at`) VALUES (?, ?, ?, ?)");                        
                        $insertStmt->bind_param("ssss", $d_id, $pa1, $pa2, $date_update); 
                        if ($insertStmt->execute()) {                            
                            logActivity('Address Proof Added', $d_id, "Address Proof of Driver $d_id has been added by Controller.");
                        } else {
                            echo "Database insertion failed.";                            
                        } 
                        }
                        header("Location: view-driver.php?d_id=$d_id#tabs-document");
                        } catch (Exception $e) {
                            echo "An error occurred: " . $e->getMessage();
                        }
                        } else {            
                            echo "File upload failed, please try again.";            
                            header('location: view-driver.php?d_id='.$d_id.'#tabs-document');                                    
                        }                            
                        } else {        
                            echo "Invalid file type.";        
                            header('location: view-driver.php?d_id='.$d_id.'#tabs-document');                                
                        }                       
                        }
?>