<?php
include('config.php');
if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];
    $targetDir = "img/drivers/address-proof/";
    $fileExtension = strtolower(pathinfo($_FILES["pa1"]["name"], PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
    $uniqueId = uniqid();  // Generate a unique identifier
    $pa1 = $uniqueId . "." . $fileExtension;  // Append the unique identifier to the file name
    $targetFilePath = $targetDir . $pa1;
    if (in_array($fileExtension, $allowTypes)) {												
        if (move_uploaded_file($_FILES["pa1"]["tmp_name"], $targetFilePath)) {            
            $insert = $connect->query("UPDATE `driver_documents` SET `address_proof_1`='$pa1' WHERE `d_id`='$d_id'");
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
