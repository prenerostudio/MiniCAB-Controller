<?php
include('config.php');
if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];    
    $targetDir = "img/drivers/driving-license/";
    $fileExtension = strtolower(pathinfo($_FILES["dl_front"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    $uniqueId = uniqid();  
    $dl_front = $uniqueId . "." . $fileExtension;  
    $targetFilePath = $targetDir . $dl_front;
    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["dl_front"]["tmp_name"], $targetFilePath)) {           
            $insert = $connect->query("UPDATE `driver_documents` SET `d_license_front`='$dl_front' WHERE `d_id`='$d_id'");
            if($insert) {
                $actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Driving License Updated',											
											'Controller',											
											'Driving License of Driver " . $d_id . " Has Been uploaded by Controller.')";
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
