<?php
require 'config.php';

// Function to handle image upload
function uploadImage() {
    $targetDir = "img/drivers/";
    $targetFilePath = $targetDir . basename($_FILES["dpic"]["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
	 $uniqueId = uniqid();  // Generate a unique identifier

    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["dpic"]["tmp_name"], $targetFilePath)) {
            return $driver_img = $uniqueId . "_" . basename($_FILES["dpic"]["name"]);
        } else {
            return false;
        }
    }
    return false;
}

$dname = $_POST['dname'];
$demail = $_POST['demail'];
$dphone = $_POST['dphone'];
$dauth = $_POST['dauth'];
$dgender = $_POST['dgender'];
$dlang = $_POST['dlang'];
$licence = $_POST['licence'];
$lexp = $_POST['lexp'];
$pco = $_POST['pco'];
$pcoexp = $_POST['pcoexp'];
$remarks = $_POST['remarks'];
$address = $_POST['address'];
$status = 0 ;

$date = date("Y-m-d H:i:s");

// Check if the email already exists
$stmt_check = $connect->prepare("SELECT COUNT(*) FROM `drivers` WHERE `d_phone` = ?");
$stmt_check->bind_param("s", $dphone);
$stmt_check->execute();
$stmt_check->bind_result($phone_count);
$stmt_check->fetch();
$stmt_check->close();

if ($phone_count > 0) {
    // The email already exists, handle the error
    echo 'User already exists. Please use a different Phone Number.';
} else {
  
	
    $dpic = uploadImage();

    if ($dpic) {
        $sql = "INSERT INTO `drivers`( `d_name`, `d_email`, `d_phone`, `d_address`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `d_remarks`, `acount_status`, `driver_reg_date`) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("sssssssssssssss", $dname, $demail, $dphone, $address,  $dpic, $dgender, $dlang, $dauth, $licence, $lexp, $pco, $pcoexp, $remarks, $status, $date); 

        if ($stmt->execute()) {
            // Redirect on successful insertion
            header('Location: drivers.php');
            exit();
        } else {
            // Handle the error
            header('Location: drivers.php');
        }

        $stmt->close();
    } else {
		
		 $sql = "INSERT INTO `drivers`( `d_name`, `d_email`, `d_phone`, `d_address`, `d_gender`, `d_language`, `licence_authority`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `d_remarks`, `acount_status`, `driver_reg_date`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("ssssssssssssss", $dname, $demail, $dphone, $address, $dgender, $dlang, $dauth, $licence, $lexp, $pco, $pcoexp, $remarks, $status, $date); 

        if ($stmt->execute()) {
            // Redirect on successful insertion
			
            header('Location: drivers.php');
            exit();
        } else {
            // Handle the error
             header('Location: drivers.php');
        }
		
		
        //echo 'Sorry, only JPG, JPEG, PNG, GIF files are allowed for the image.';
    }
}

$connect->close();
?>
