<?php
include('config.php');
include('session.php');

$ts_date = $_POST['mdate'];
$stime  = $_POST['stime'];
$etime  = $_POST['etime'];

$sql = "INSERT INTO `time_slots`(										
								`ts_date`, 
								`start_time`, 
								`end_time`
								) VALUES (
								'$ts_date',
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
	header('Location: available-time-slots.php');    
	exit();    
} else {	
	
	header('Location: available-time-slots.php');    
}
$connect->close();
?>