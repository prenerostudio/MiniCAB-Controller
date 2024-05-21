<?php
include('config.php');
if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];    
    $targetDir = "img/drivers/vehicle/picture/";
    $fileExtension = strtolower(pathinfo($_FILES["pic2"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    $uniqueId = uniqid();  
    $pic2 = $uniqueId . "." . $fileExtension; 
    $targetFilePath = $targetDir . $pic2;
    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["pic2"]["tmp_name"], $targetFilePath)) {           
            $insert = $connect->query("UPDATE `vehicle_documents` SET `vehicle_picture_back`='$pic2' WHERE `d_id`='$d_id'");
            if($insert) {
                echo "File uploaded successfully.";
				$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Vehicle Back Picture Updated',											
											'Controller',											
											'Vehicle Back Picture of Driver " . $d_id . " Has Been uploaded by Controller.')";	
				$actr = mysqli_query($connect, $actsql);													
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
