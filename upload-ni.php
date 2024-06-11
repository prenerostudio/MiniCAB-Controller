<?php
include('config.php');
include('session.php');

if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];  	
    $targetDir = "img/drivers/ni/";
    $fileExtension = strtolower(pathinfo($_FILES["ni"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    $uniqueId = uniqid();  
    $ni = $uniqueId . "." . $fileExtension;  
    $targetFilePath = $targetDir . $ni;
    if (in_array($fileExtension, $allowTypes)) {														
        if (move_uploaded_file($_FILES["ni"]["tmp_name"], $targetFilePath)) {            
            $insert = $connect->query("UPDATE `driver_documents` SET `national_insurance`='$ni' WHERE `d_id`='$d_id'");
            if($insert) {				
				$activity_type = 'National Insurance Updated';			
				$user_type = 'user';			
				$details = "National Insurance of Driver " . $d_id . " Has Been uploaded by Controller.";			
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