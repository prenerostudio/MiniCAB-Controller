<?php
include('config.php');	
include('session.php');

$v_id = $_GET['v_id'];
$sql = "UPDATE `vehicles` SET `v_img`='' WHERE `v_id`='$v_id'";
$result = $connect->query($sql);

if($result){ 	
	$activity_type = 'Vehicle Image Delete';	
	$user_type = 'user';	
	$details = "Vehicle Image Has Been Accepted by Controller.";
	
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
	header('Location: view-vehicle.php?v_id='.$v_id);
} else {
	header('Location: view-vehicle.php?v_id='.$v_id);
}
?>