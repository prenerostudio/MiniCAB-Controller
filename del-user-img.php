<?php
include('config.php');
	$user_id = $_GET['user_id'];

	$sql = "UPDATE `users` SET `user_pic`='' WHERE `user_id`='$user_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('User Img has been removed from the record')</script>";
		header('location: profile-setting.php'); 
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: profile-setting.php'); 
	}
?>