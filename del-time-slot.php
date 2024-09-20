<?php
include('config.php');
include('session.php'); 
	
$ts_id = $_GET['ts_id'];
$sql = "DELETE FROM `time_slots` WHERE `ts_id`='$ts_id'";
$result = $connect->query($sql);

if($result){ 	
	$activity_type = 'Time Slot Deleted ';	
	$user_type = 'user';	
	$details = "Time Slot Has Been Deleted by Controller.";
	
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
	header('location: available-time-slots.php');
} else {
	header('location: available-time-slots.php');
}
?>