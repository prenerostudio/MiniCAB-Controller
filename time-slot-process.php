<?php
include('config.php');

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
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Time Slot Added ',											
											'Controller',											
											'New Time Slot Has Been Added by Controller.')";		
	$actr = mysqli_query($connect, $actsql);
	header('Location: time-slots.php');    
	exit();    
} else {	
	
	header('Location: time-slots.php');    
}
$connect->close();
?>