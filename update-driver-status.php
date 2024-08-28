<?php
include('config.php');
include('session.php');

$d_id = $_GET['d_id'];
$status = 1;
$sql = "UPDATE `drivers` SET  `acount_status`='$status',`driver_reg_date`='$date' WHERE `d_id`='$d_id'";
$result = $connect->query($sql);
if($result){ 
	$activity_type = 'Driver Verified';
	$user_type = 'user';
	$details = "Driver $d_id Has Been verified by Controller.";
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
	header('location: view-driver.php?d_id='.$d_id);	
} else {		
	header('location: view-driver.php?d_id='.$d_id);	
}
?>