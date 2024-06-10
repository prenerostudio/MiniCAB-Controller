<?php
include('config.php');
include('session.php');
	
$des_id = $_GET['des_id'];
$sql = "DELETE FROM `destinations` WHERE `des_id`='$des_id'";
$result = $connect->query($sql);

if($result){ 	
	$activity_type = 'Destination Deleted';	
	$user_type = 'user';	
	$details = "Destination Has Been Deleted by Controller.";
	
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
	header('location: destinations.php');
} else {
	header('location: destinations.php');
}
?>