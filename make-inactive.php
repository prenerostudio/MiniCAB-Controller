<?php
include('config.php');
include('session.php');

$d_id = $_GET['d_id'];
$status = 2;
$date = date("Y-m-d H:i:s");
$sql = "UPDATE `drivers` SET `acount_status`='$status',`driver_reg_date`='$date' WHERE `d_id`='$d_id'";
$result = $connect->query($sql);

if($result){
	$activity_type = 'Driver Inactive';	
	$user_type = 'user';	
	$details = "Driver " . $d_id . " Has Been made by Controller.";
	
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
	
	header('location: drivers.php');	
} else {
	header('location: drivers.php');	
}
?>