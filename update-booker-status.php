<?php
include('config.php');
include('session.php');
	
$c_id = $_GET['c_id'];
$status = 1;	
$sql = "UPDATE `clients` SET  `acount_status`='$status' WHERE `c_id`='$c_id'";
$result = $connect->query($sql);
if($result){ 
	$activity_type = 'Booker Verified';	
	$user_type = 'user';
	$details = "Booker " . $c_id . " Has Been Verified by Controller.";
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
	header('location: view-booker.php?c_id='.$c_id);	
} else {	
	header('location: view-booker.php?c_id='.$c_id);
}
?>