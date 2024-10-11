<?php
include('config.php');
include('session.php');
	
$dt_id = $_GET['dt_id'];
$sql = "DELETE FROM `special_dates` WHERE `dt_id`='$dt_id'";
$result = $connect->query($sql);

if($result){ 	
	$activity_type = 'Special Date Deleted';	
	$user_type = 'user';	
	$details = "Special Date Has Been Deleted by Controller.";
	
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
	header('location: pricing.php');
} else {
	header('location: pricing.php');
}
?>