<?php
require 'config.php';

// Function to handle image upload
function uploadImage() {
    $targetDir = "img/vehicles/";
    $targetFilePath = $targetDir . basename($_FILES["v_img"]["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');

    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["v_img"]["tmp_name"], $targetFilePath)) {
            return $targetFilePath;
        } else {
            return false;
        }
    }
    return false;
}

$vname = $_POST['vname'];
$seats = $_POST['seats'];
$bag = $_POST['bags'];
$wchair = $_POST['wchair'];
$trailer = $_POST['trailer'];
$booster = $_POST['booster'];
$babyc = $_POST['babyc'];
$pricing = $_POST['pricing'];
$date = date("Y-m-d H:i:s");


   
    // Handle image upload
    $v_img = uploadImage();

    if ($v_img) {
        $sql = "INSERT INTO `vehicles`(`v_name`, `v_seat`, `v_bags`, `v_wchair`, `v_trailer`, `v_booster`, `v_baby`, `v_pricing`, `v_img`, `date_added`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("ssssssssss", $vname, $seats, $bag, $wchair,  $trailer, $booster, $babyc, $pricing, $v_img, $date); 

        if ($stmt->execute()) {
            // Redirect on successful insertion
            header('Location: vehicle.php');
            exit();
        } else {
            // Handle the error
            echo 'Error: ' . $stmt->error;
        }

        $stmt->close();
    } else {
		
		 $sql = "INSERT INTO `vehicles`(`v_name`, `v_seat`, `v_bags`, `v_wchair`, `v_trailer`, `v_booster`, `v_baby`, `v_pricing`, `date_added`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("sssssssss", $vname, $seats, $bag, $wchair,  $trailer, $booster, $babyc, $pricing, $date); 
        if ($stmt->execute()) {
            // Redirect on successful insertion
            header('Location: vehicle.php');
            exit();
        } else {
            // Handle the error
            echo 'Error: ' . $stmt->error;
        }
		
		
        //echo 'Sorry, only JPG, JPEG, PNG, GIF files are allowed for the image.';
    }

$connect->close();
?>
