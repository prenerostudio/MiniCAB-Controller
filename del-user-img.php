<?php
include('config.php');
include('session.php');
	
$user_id = $_GET['user_id'];
$sql = "UPDATE `users` SET `user_pic`='' WHERE `user_id`='$user_id'";
$result = $connect->query($sql);
if($result){ 
    $activity_type = 'User Profile Image Deleted';
    $user_type = 'user';
    $details = "User Profile Image Has Been Deleted by Controller.";
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
    header('location: profile-setting.php'); 
} else {
    header('location: profile-setting.php'); 
}
?>