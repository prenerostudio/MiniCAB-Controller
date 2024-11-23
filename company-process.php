<?php
require 'config.php';
include('session.php');


function uploadImage() {

    $targetDir = "img/companies/";

    $fileExtension = strtolower(pathinfo($_FILES["cpic"]["name"], PATHINFO_EXTENSION));

    $uniqueFilename = uniqid() . '_' . time() . '.' . $fileExtension;

    $targetFilePath = $targetDir . $uniqueFilename;

    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');

    if (in_array($fileExtension, $allowTypes)) {

        if (move_uploaded_file($_FILES["cpic"]["tmp_name"], $targetFilePath)) {

            return $uniqueFilename; 

            } else {
            
                return false;
        
                
            }
    
            
            }
    
            return false;

            
            }


            $cname = $_POST['cname'];

            $rpname = $_POST['rpname'];

            $cemail = $_POST['cemail'];

            $cphone = $_POST['cphone'];

            $cpass = $_POST['cpass'];

            $cpin = $_POST['cpin'];

            $pc = $_POST['pc'];

            $caddress = $_POST['caddress'];

            $acount_status = 0;




            $stmt_check = $connect->prepare("SELECT COUNT(*) FROM `companies` WHERE `com_phone` = ?");

            $stmt_check->bind_param("s", $cphone);

            $stmt_check->execute();

            $stmt_check->bind_result($phone_count);

            $stmt_check->fetch();

            $stmt_check->close();


            if ($phone_count > 0) {
     
                echo '<script>alert("Phone already exists. Please use a different Phone Number.");';
    
                echo 'window.location.href = "companies.php";</script>';

                
            } else {
    
    
                $cpic = uploadImage();

      
                if ($cpic !== false) {
        

                    $sql = "INSERT INTO `companies`(`com_name`, `com_email`, `com_phone`, `com_password`, `com_address`, `com_person`, `com_pic`, `postal_code`, `com_pin`, `acount_status`)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
                    $stmt = $connect->prepare($sql);
        
                    $stmt->bind_param("ssssssssss", $cname, $cemail, $cphone, $cpass, $caddress, $rpname, $cpic, $pc, $cpin, $acount_status);
    
                    
                } else {
         
        
                    $sql = "INSERT INTO `companies`(`com_name`, `com_email`, `com_phone`, `com_password`, `com_address`, `com_person`, `postal_code`, `com_pin`, `acount_status`)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
                    $stmt = $connect->prepare($sql);
        
                    $stmt->bind_param("sssssssss", $cname, $cemail, $cphone, $cpass, $caddress, $rpname, $pc, $cpin, $acount_status);
   
                    
                }

    
                if ($stmt->execute()) {						
		
                    $activity_type = 'New Company Added';			
		
                    $user_type = 'user';        		
		
                    $details = "New Company " . $cname . " Has been Added by Controller.";
		
                    $actsql = "INSERT INTO `activity_log`(
							`activity_type`, 
							`user_type`, 
							`user_id`, 
							`details`
							) VALUES (
							'$activity_type',
							'$user_type',
							'$myId',
							'$details')";		
					
		
                    $actr = mysqli_query($connect, $actsql);				
		
                    header('Location: companies.php'); 
        
                    exit();
    
                    
                } else {
        
                    header('Location: companies.php'); 
    
                    
                }
    
                $stmt->close();

                
                }

                $connect->close();
?>