<?php
include('config.php');
if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];  	
    $targetDir = "img/drivers/Passport/";
    $fileExtension = strtolower(pathinfo($_FILES["pass"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
    $uniqueId = uniqid();  // Generate a unique identifier
    $pass = $uniqueId . "." . $fileExtension;  // Append the unique identifier to the file name
    $targetFilePath = $targetDir . $pass;
    if (in_array($fileExtension, $allowTypes)) {														
        if (move_uploaded_file($_FILES["pass"]["tmp_name"], $targetFilePath)) {            
            $insert = $connect->query("UPDATE `drivers` SET `passport`='$pass'  WHERE `d_id`='$d_id'");
            if($insert) {
                echo "File uploaded successfully.";
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