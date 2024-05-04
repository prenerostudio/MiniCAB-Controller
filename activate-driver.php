<?php
include('config.php');

$d_id = $_GET['d_id'];
$status = 1;

$sql = "UPDATE `drivers` SET `acount_status`='$status' WHERE `d_id`='$d_id'";
$result = $connect->query($sql);

if($result){ 	
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Activate Driver ',											
											'Controller',											
											'Driver " . $d_id . " Has Been Activated')";		
						
	$actr = mysqli_query($connect, $actsql);		
	header('location: drivers.php');	
} else {	
	header('location: drivers.php');	
}
?>