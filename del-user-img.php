<?php
include('config.php');
	
$user_id = $_GET['user_id'];
$sql = "UPDATE `users` SET `user_pic`='' WHERE `user_id`='$user_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'User Profile Image Deleted',											
											'Controller',											
											'User Profile Image Has Been Deleted by Controller.')";		
	
	$actr = mysqli_query($connect, $actsql);		
	header('location: profile-setting.php'); 
} else {
	header('location: profile-setting.php'); 
}
?>