<?php
require 'config.php';
include('session.php');

function uploadImage() {
    $targetDir = "img/users/";
    $fileExtension = strtolower(pathinfo($_FILES["upic"]["name"], PATHINFO_EXTENSION));
    $uniqueFilename = uniqid() . '_' . time() . '.' . $fileExtension; 
    $targetFilePath = $targetDir . $uniqueFilename;
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');

    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["upic"]["tmp_name"], $targetFilePath)) {
            return $uniqueFilename; 
        } else {
            return false;
        }
    }
    return false;
}
$upic = uploadImage();

$fname = $_POST['fname'];
$lname = $_POST['lname'];
$uemail = $_POST['uemail'];
$upass = $_POST['upass'];
$uphone = $_POST['uphone'];
$ugender = $_POST['ugender'];
$udesig = $_POST['udesig'];
$uni = $_POST['uni'];
$uaddress = $_POST['uaddress'];
$ucity = $_POST['ucity'];
$ustate = $_POST['ustate'];
$country_id = $_POST['country_id'];
$pc = $_POST['pc'];

// Check if email already exists
$emailCheckSql = "SELECT * FROM `users` WHERE `user_email` = '$uemail'";
$emailCheckResult = mysqli_query($connect, $emailCheckSql);

if (mysqli_num_rows($emailCheckResult) > 0) {
    // Email already exists
    header('location: all-users.php?error=EmailAlreadyExists');
    exit();
}

// If email doesn't exist, proceed with insertion
if ($upic) {
    $sql = "INSERT INTO `users`(
                                `first_name`, 
                                `last_name`, 
                                `user_email`, 
                                `user_password`, 
                                `user_phone`, 
                                `user_gender`, 
                                `designation`, 
                                `address`, 
                                `city`, 
                                `state`, 
                                `country_id`, 
                                `pc`, 
                                `nid`, 
                                `user_pic`, 
                                `reg_date`
                                ) VALUES (
                                '$fname',
                                '$lname',
                                '$uemail',
                                '$upass',
                                '$uphone',
                                '$ugender',
                                '$udesig',
                                '$uaddress',
                                '$ucity',
                                '$ustate',
                                '$country_id',
                                '$pc',
                                '$uni',
                                '$upic',
                                NOW())";
} else {
    $sql = "INSERT INTO `users`(
                                `first_name`, 
                                `last_name`, 
                                `user_email`, 
                                `user_password`, 
                                `user_phone`, 
                                `user_gender`, 
                                `designation`, 
                                `address`, 
                                `city`, 
                                `state`, 
                                `country_id`, 
                                `pc`, 
                                `nid`, 
                                `reg_date`
                                ) VALUES (
                                '$fname',
                                '$lname',
                                '$uemail',
                                '$upass',
                                '$uphone',
                                '$ugender',
                                '$udesig',
                                '$uaddress',
                                '$ucity',
                                '$ustate',
                                '$country_id',
                                '$pc',
                                '$uni',
                                NOW())";
}

$result = mysqli_query($connect, $sql);       
if ($result) {        
    $activity_type = 'New Admin Added';    
    $user_type = 'user';    
    $details = "New Admin " . $fname . " Has Been Added by Controller.";
    
    $actsql = "INSERT INTO `activity_log`(
                                        `activity_type`, 
                                        `user_type`, 
                                        `user_id`, 
                                        `details`
                                        ) VALUES (
                                        '$activity_type',
                                        '$user_type',
                                        '$myId',
                                        '$details')";    
    $actr = mysqli_query($connect, $actsql);                            
    header('location: all-users.php');    
    exit();    
} else {           
    header('location: all-users.php');    
}
$connect->close();
?>
