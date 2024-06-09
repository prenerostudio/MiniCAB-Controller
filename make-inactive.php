<?php
include('config.php');

$d_id = $_GET['d_id'];
$status = 2;
$date = date("Y-m-d H:i:s");
$sql = "UPDATE `drivers` SET `acount_status`='$status',`driver_reg_date`='$date' WHERE `d_id`='$d_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user_type`,											
											`details`											
											) VALUES (											
											'Driver Inactive ',											
											'user',											
											'Driver " . $d_id . " Has Been made by Controller.')";		
	
	$actr = mysqli_query($connect, $actsql);		
	header('location: drivers.php');	
} else {
	header('location: drivers.php');	
}
?>