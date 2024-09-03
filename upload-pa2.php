<?php
include('config.php');
include('session.php');

if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];
    $targetDir = "img/drivers/address-proof/";
    $fileExtension = strtolower(pathinfo($_FILES["pa2"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    $uniqueId = uniqid();  // Generate a unique identifier
    $pa2 = $uniqueId . "." . $fileExtension;  // Append the unique identifier to the file name
    $targetFilePath = $targetDir . $pa2;
    if (in_array($fileExtension, $allowTypes)) {												
        if (move_uploaded_file($_FILES["pa2"]["tmp_name"], $targetFilePath)) {            
            $insert = $connect->query("UPDATE `driver_documents` SET `address_proof_2`='$pa2' WHERE `d_id`='$d_id'");
            if($insert) {				
				$activity_type = 'Address Proof Updated';			
				$user_type = 'user';			
				$details = "Address Proof of Driver $d_id Has Been uploaded by Controller.";			
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
                header('location: view-driver.php?d_id='.$d_id.'#tabs-document');
            } else {
                echo "Database update failed.";
                header('location: view-driver.php?d_id='.$d_id.'#tabs-document');
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
