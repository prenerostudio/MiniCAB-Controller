<?php
require 'config.php';

// Function to handle image upload
function uploadImage() {
    $targetDir = "img/drivers/";
    $targetFilePath = $targetDir . basename($_FILES["dpic"]["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');

    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["dpic"]["tmp_name"], $targetFilePath)) {
            return $targetFilePath;
        } else {
            return false;
        }
    }
    return false;
}

$dname = $_POST['dname'];
$demail = $_POST['demail'];
$dphone = $_POST['dphone'];
$dpass = $_POST['dpass'];
$dgender = $_POST['dgender'];
$dlang = $_POST['dlang'];
$dv = $_POST['dv'];
$licence = $_POST['licence'];
$lexp = $_POST['lexp'];
$pco = $_POST['pco'];
$pcoexp = $_POST['pcoexp'];
$remarks = $_POST['remarks'];
$status='New';

$date = date("Y-m-d H:i:s");

// Check if the email already exists
$stmt_check = $connect->prepare("SELECT COUNT(*) FROM `drivers` WHERE `d_email` = ?");
$stmt_check->bind_param("s", $demail);
$stmt_check->execute();
$stmt_check->bind_result($email_count);
$stmt_check->fetch();
$stmt_check->close();

if ($email_count > 0) {
    // The email already exists, handle the error
    echo 'Email already exists. Please use a different email address.';
} else {
    // Email doesn't exist, proceed with insertion
    $cp = password_hash($dpass, PASSWORD_BCRYPT);

    // Handle image upload
    $dpic = uploadImage();

    if ($dpic) {
        $sql = "INSERT INTO `drivers`( `d_name`, `d_email`, `d_password`, `d_phone`, `d_pic`, `d_gender`, `d_language`, `v_id`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `d_remarks`, `status`, `driver_reg_date`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("sssssssssssssss", $dname, $demail, $cp, $dphone,  $dpic, $dgender, $dlang, $dv, $licence, $lexp, $pco, $pcoexp, $remarks, $status, $date); 

        if ($stmt->execute()) {
            // Redirect on successful insertion
            header('Location: drivers.php');
            exit();
        } else {
            // Handle the error
            echo 'Error: ' . $stmt->error;
        }

        $stmt->close();
    } else {
		
		 $sql = "INSERT INTO `drivers`( `d_name`, `d_email`, `d_password`, `d_phone`, `d_gender`, `d_language`, `v_id`, `d_licence`, `d_licence_exp`, `pco_licence`, `pco_exp`, `d_remarks`, `status`, `driver_reg_date`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("ssssssssssssss", $dname, $demail, $cp, $dphone, $dgender, $dlang, $dv, $licence, $lexp, $pco, $pcoexp, $remarks, $status, $date); 

        if ($stmt->execute()) {
            // Redirect on successful insertion
            header('Location: drivers.php');
            exit();
        } else {
            // Handle the error
            echo 'Error: ' . $stmt->error;
        }
		
		
        //echo 'Sorry, only JPG, JPEG, PNG, GIF files are allowed for the image.';
    }
}

$connect->close();
?>
