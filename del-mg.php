<?php
include('config.php');
include('session.php');
	
$mg_id = $_GET['mg_id'];
$sql = "DELETE FROM `mg_charges` WHERE `mg_id`='$mg_id'";
$result = $connect->query($sql);

if($result){ 	
	$activity_type = 'Meet & Greet Charges Deleted';	
	$user_type = 'user';	
	$details = "Meet & Greet Charges Has Been Deleted by Controller.";
	
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