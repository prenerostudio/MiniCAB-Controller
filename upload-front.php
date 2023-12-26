<?php

include('config.php');

// Check if form is submitted
if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];

    // Process the uploaded image
    $targetDir = "img/drivers/Driving-Licence/";
    $fileExtension = strtolower(pathinfo($_FILES["dl_front"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
    $uniqueId = uniqid();  // Generate a unique identifier
    $dl_front = $uniqueId . "." . $fileExtension;  // Append the unique identifier to the file name

    $targetFilePath = $targetDir . $dl_front;

    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["dl_front"]["tmp_name"], $targetFilePath)) {
            // Insert image data into database
            $insert = $connect->query("UPDATE `drivers` SET `dl_front`='$dl_front' WHERE `d_id`='$d_id'");

            if($insert) {
                echo "File uploaded successfully.";
                header('location: view-driver.php?d_id='.$d_id.'#tabs-document');
            } else {
                echo "Database update failed.";
                header('location: drivers.php');
            }
        } else {
            echo "File upload failed, please try again.";
            header('location: drivers.php');
        }
    } else {
        echo "Invalid file type.";
        header('location: drivers.php');
    }

    // Terminate script execution
    // die;
}
?>
