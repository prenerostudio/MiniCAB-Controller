<?php
include('config.php');
$fare_id = $_GET['id'];
$status= 'Corrected';
$sql = "UPDATE `fares` SET `fare_status`='$status' WHERE `fare_id`='$fare_id'";
$result = $connect->query($sql);	
if($result){ 	
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`, 
											`details`
											) VALUES (
											'Fare Correction ',
											'Cotroller',
											'Controller has approve Fare against Fare ID: " . $fare_id . "')";		
		
	$actr = mysqli_query($connect, $actsql);	
	header('location: fare-corrections.php');	
} else {		
	header('location: fare-corrections.php');
}
?>