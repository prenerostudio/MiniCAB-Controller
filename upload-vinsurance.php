<?php
include('config.php');
include('session.php');

if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];    
    $targetDir = "img/drivers/vehicle/insurance/";
    $fileExtension = strtolower(pathinfo($_FILES["ins"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    $uniqueId = uniqid();  
    $ins = $uniqueId . "." . $fileExtension;
    $targetFilePath = $targetDir . $ins;
    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["ins"]["tmp_name"], $targetFilePath)) {           
            $insert = $connect->query("UPDATE `vehicle_documents` SET `insurance`='$ins' WHERE `d_id`='$d_id'");
            if($insert) {				
				$activity_type = 'Vehicle Insurance Updated';		
				$user_type = 'user';		
				$details = "Vehicle Insurance of Driver $d_id Has Been uploaded by Controller.";			
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
                echo "File uploaded successfully.";
                header('location: view-driver.php?d_id='.$d_id.'#tabs-vdocument');
            } else {
                echo "Database update failed.";
                header('location: view-driver.php?d_id='.$d_id.'#tabs-vdocument');
            }
        } else {
            echo "File upload failed, please try again.";
            header('location: view-driver.php?d_id='.$d_id.'#tabs-vdocument');
        }
    } else {
        echo "Invalid file type.";
        header('location: view-driver.php?d_id='.$d_id.'#tabs-vdocument');
    }
}
?>
