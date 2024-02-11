<?php
require 'config.php';

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
$date = date("Y-m-d H:i:s");
     
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
						`nid`='$nid',
						`reg_date`='$date' WHERE `user_id`='$user_id'";
        
$result = mysqli_query($connect, $sql);       
if ($result) {	    
	header('location: profile-setting.php');    
	exit();    
} else {           
	header('location: profile-setting.php');    
}
$connect->close();
?>
