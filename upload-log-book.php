<?php
include('config.php');
if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];    
    $targetDir = "img/drivers/vehicle/log-book/";
    $fileExtension = strtolower(pathinfo($_FILES["log_book"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
    $uniqueId = uniqid();  // Generate a unique identifier
    $log_book = $uniqueId . "." . $fileExtension;  // Append the unique identifier to the file name
    $targetFilePath = $targetDir . $log_book;
    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["log_book"]["tmp_name"], $targetFilePath)) {           
            $insert = $connect->query("UPDATE `vehicle_documents` SET `log_book`='$log_book' WHERE `d_id`='$d_id'");
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
