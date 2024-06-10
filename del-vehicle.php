<?php
include('config.php');
include('session.php');
	
$v_id = $_GET['v_id'];
$sql = "DELETE FROM `vehicles` WHERE `v_id`='$v_id'";
$result = $connect->query($sql);

if($result){ 	
	$activity_type = 'Vehicle Deleted';	
	$user_type = 'user';	
	$details = "Vehicle Has Been Deleted by Controller.";
	
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
	header('location: vehicles.php');
} else {
	header('location: vehicles.php');
}
?>