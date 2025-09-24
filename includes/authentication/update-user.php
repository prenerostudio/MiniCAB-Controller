<?php
require '../../config.php';
include('../../session.php');

$user_id = $_POST['user_id'];
$fname = $_POST['fname'];
$lname = $_POST['lname'];
$uemail = $_POST['uemail'];
$uphone = $_POST['uphone'];
$desig = $_POST['desig'];
$nid = $_POST['nid'];
$address = $_POST['address'];
$city = $_POST['city'];
$state = $_POST['state'];
$country = $_POST['country'];
$pc = $_POST['pc'];
     
$sql = "UPDATE `users` SET 
			`first_name`='$fname',
			`last_name`='$lname',
			`user_phone`='$uphone',
			`designation`='$desig',
			`address`='$address',
			`city`='$city',
			`state`='$state',
			`country_id`='$country',
			`pc`='$pc',
			`nid`='$nid' WHERE `user_id`='$user_id'";        

$result = mysqli_query($connect, $sql);       

if ($result) {

    $activity_type = 'Admin Profile Updated';	

    $user_type = 'user';

    $details = "Admin Profile Has Been updated by Controller.";

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

    header('location: ../../profile-setting.php');    

    exit();    
} else {           

    header('location: ../../profile-setting.php');    
}
$connect->close();
?>
