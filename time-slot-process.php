<?php
include('config.php');
include('session.php');

$at_date = $_POST['mdate'];
$stime  = $_POST['stime'];
$etime  = $_POST['etime'];

$sql = "INSERT INTO `availability_times`(
										`at_date`, 
										`start_time`, 
										`end_time`
										) VALUES (
										'$at_date',
										'$stime',
										'$etime')";                
$result = mysqli_query($connect, $sql);       
if ($result) { 	
	$activity_type = 'Time Slot Added';	
	$user_type = 'user';	
	$details = "New Time Slot Has Been Added by Controller.";
	
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
	header('Location: time-slots.php');    
	exit();    
} else {	
	
	header('Location: time-slots.php');    
}
$connect->close();
?>