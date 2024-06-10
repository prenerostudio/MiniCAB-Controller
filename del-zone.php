<?php
include('config.php');
include('session.php'); 
	
$zone_id = $_GET['z_id'];
$sql = "DELETE FROM `zones` WHERE `zone_id`='$zone_id'";
$result = $connect->query($sql);

if($result){ 	
	$activity_type = 'Zone Deleted ';	
	$user_type = 'user';	
	$details = "Zone Address Has Been Deleted by Controller.";
	
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
	header('location: zones.php');
} else {
	header('location: zones.php');
}
?>