<?php
include('config.php');

$d_id = $_GET['d_id'];
$status = 1;
$sql = "UPDATE `drivers` SET  `acount_status`='$status',`driver_reg_date`='$date' WHERE `d_id`='$d_id'";
$result = $connect->query($sql);
if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Driver Verified',											
											'Controller',											
											'Driver " . $d_id . " Has Been verified by Controller.')";		
	$actr = mysqli_query($connect, $actsql);	
	header('location: view-driver.php?d_id='.$d_id);	
} else {		
	header('location: view-driver.php?d_id='.$d_id);	
}
?>