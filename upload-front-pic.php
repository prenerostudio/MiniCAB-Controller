<?php
include('config.php');
if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];    
    $targetDir = "img/drivers/vehicle/picture/";
    $fileExtension = strtolower(pathinfo($_FILES["pic1"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
    $uniqueId = uniqid();  // Generate a unique identifier
    $pic1 = $uniqueId . "." . $fileExtension;  // Append the unique identifier to the file name
    $targetFilePath = $targetDir . $pic1;
    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["pic1"]["tmp_name"], $targetFilePath)) {           
            $insert = $connect->query("UPDATE `vehicle_documents` SET `vehicle_picture_front`='$pic1' WHERE `d_id`='$d_id'");
            if($insert) {
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
