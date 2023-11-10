<?php

include('config.php');

// Check if form is submitted
if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];

    // Process the uploaded image
    $targetDir = "img/drivers/Work-Proof/";
    $targetFilePath = $targetDir . basename($_FILES["wp"]["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
    $wp = ($_FILES["wp"]["name"]);

    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["wp"]["tmp_name"], $targetFilePath)) {
            // Insert image data into database
            $insert = $connect->query("UPDATE `drivers` SET `work_proof`='$wp'  WHERE `d_id`='$d_id'");

            if($insert) {
                echo "File uploaded successfully.";
                header('location: drivers.php');
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
