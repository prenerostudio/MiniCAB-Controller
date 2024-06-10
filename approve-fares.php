<?php
include('config.php');
include('session.php');
$fare_id = $_GET['id'];
$status= 'Corrected';
$sql = "UPDATE `fares` SET `fare_status`='$status' WHERE `fare_id`='$fare_id'";
$result = $connect->query($sql);	
if($result){ 	
		
	$activity_type = 'Fare Correction';		
	$user_type = 'user';        	
	$details = "Controller has approve Fare against Fare ID: " . $fare_id . "')";
			
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
	header('location: fare-corrections.php');	
} else {		
	header('location: fare-corrections.php');
}
?>