<?php
require 'config.php';
include('session.php');	



function uploadImage() {

    $targetDir = "img/customers/";

    $fileExtension = strtolower(pathinfo($_FILES["cpic"]["name"], PATHINFO_EXTENSION));

    $uniqueFilename = uniqid() . '_' . time() . '.' . $fileExtension; // Generate unique filename

    $targetFilePath = $targetDir . $uniqueFilename;

    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');


    if (in_array($fileExtension, $allowTypes)) {

        if (move_uploaded_file($_FILES["cpic"]["tmp_name"], $targetFilePath)) {

            return $uniqueFilename; // Return the unique filename

            } else {
            
                return false;
        
                
            }
    
            
            }
    
            return false;

            
            }



            $cname = $_POST['cname'];

            $cemail = $_POST['cemail'];

            $cphone = $_POST['cphone'];

            $cpass = $_POST['cpass'];

            $cgender = $_POST['cgender'];

            $clang = $_POST['clang'];

            $pc = $_POST['pc'];

            $cni = $_POST['cni'];

            $caddress = $_POST['caddress'];

            $cothers = $_POST['cothers'];

            $com_type = $_POST['com_type'];

            $percent = $_POST['percent'];

            $fixed = $_POST['fixed'];

            $account_type = 2;


// Check if the email already exists

            $stmt_check = $connect->prepare("SELECT COUNT(*) FROM `clients` WHERE `c_phone` = ?");

            $stmt_check->bind_param("s", $cphone);

            $stmt_check->execute();

            $stmt_check->bind_result($phone_count);

            $stmt_check->fetch();

            $stmt_check->close();

            

            if ($phone_count > 0) {
     
                echo '<script>alert("Phone already exists. Please use a different Phone Number.");';
    
                echo 'window.location.href = "customers.php";</script>';

                
            
                
            } else {
    
// Handle image upload
    
                $cpic = uploadImage();


                if ($cpic !== false) {
        

        
                    $sql = "INSERT INTO `clients`(`c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `commission_type`, `percentage`, `fixed`,`account_type`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        
                    $stmt = $connect->prepare($sql);
        
        
                    $stmt->bind_param("sssssssssssssss", $cname, $cemail, $cphone, $cpass, $caddress, $cgender, $clang, $cpic, $pc, $cothers, $cni, $com_type, $percent, $fixed, $account_type);
    
        
               
                    } else {
        // Insert only name without image name

                    
                        $sql = "INSERT INTO `clients`(`c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `postal_code`, `others`, `c_ni`, `commission_type`, `percentage`, `fixed`,`account_type`)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
                    
                        $stmt = $connect->prepare($sql);
        
                   
                        $stmt->bind_param("ssssssssssssss", $cname, $cemail, $cphone, $cpass, $caddress, $cgender, $clang, $pc, $cothers, $cni, $com_type, $percent, $fixed, $account_type);
    
                        
                    }


                    if ($stmt->execute()) {		
		
                        $activity_type = 'New Booker';			
		
                        $user_type = 'user';        		
		
                        $details = "New Booker " . $cname . "  Added by Controller.";			
	
		
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
		
                        header('Location: bookers.php');         
    
                        
                    } else {
        
                        header('Location: bookers.php'); 
    
                        
                    }
    
                    $stmt->close();

                    
                    }

                    $connect->close();
?>
