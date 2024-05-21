<?php
include('config.php');
	
$d_id = $_GET['d_id'];
$sql = "DELETE FROM `drivers` WHERE `d_id`='$d_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Driver Profile Deleted',											
											'Controller',											
											'Driver Profile Has Been Deleted by Controller.')";		
		
	$actr = mysqli_query($connect, $actsql);
	header('location: drivers.php');
} else {
	header('location: drivers.php');
}
?>