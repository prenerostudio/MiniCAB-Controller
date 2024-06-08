<?php
include('config.php');
//include('header.php');

$d_id = $_GET['d_id'];
$user_id = $_GET['user_id'];
$sql = "DELETE FROM `drivers` WHERE `d_id`='$d_id'";
$result = $connect->query($sql);

if($result){ 
	$activity_type = 'Driver Profile Deleted';
			$user_type = 'user';
			$details = "Driver Profile has been deleted.";
			$actsql = "INSERT INTO `activity_log`(
											`activity_type`, 
											`user_type`, 
											`user_id`, 
											`details`
											) VALUES (
											'$activity_type',
											'$user_type',
											'$user_id',
											'$details')";		
		
			$actr = mysqli_query($connect, $actsql);
	header('location: drivers.php');
} else {
	header('location: drivers.php');
}
?>