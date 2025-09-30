<?php
include('../../config.php');
include('../../session.php');
if ($_SERVER["REQUEST_METHOD"] == "POST") {    
    $c_id = $_POST['c_id'];   
    $targetDir = "../../img/customers/";    
    $uploadOk = 1;    
    $imageFileType = strtolower(pathinfo($_FILES["fileToUpload"]["name"], PATHINFO_EXTENSION));    
    $uniqueFilename = uniqid() . '_' . time() . '.' . $imageFileType;    
    $targetFile = $targetDir . $uniqueFilename;
    $allowedExtensions = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    if (!in_array($imageFileType, $allowedExtensions)) {    
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";        	
        $uploadOk = 0;            
    }        	
    if ($uploadOk == 1) {    
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {                	
            $logoName = $uniqueFilename;            	
            $sql = "UPDATE `clients` SET `c_pic`='$logoName' WHERE `c_id`='$c_id'";            	
            $result = mysqli_query($connect, $sql);            	
            if ($result) { 	
                $activity_type = 'Customer Profile Image Update';		
                $user_type = 'user';		
                $details = "Customer Profile Image " . $c_id . " Has Been Updated by Controller.";		
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
                echo "The file " . htmlspecialchars($logoName) . " has been uploaded.";                		
                header('location: ../../view-customer.php?c_id='.$c_id);                
            } else {                                
                echo "Sorry, there was an error updating your file.";                            
            }                    
        } else {
            echo "Sorry, there was an error uploading your file.";                        
        }                
    }           
}
?>