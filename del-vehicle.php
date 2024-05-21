<?php
include('config.php');
	
$v_id = $_GET['v_id'];
$sql = "DELETE FROM `vehicles` WHERE `v_id`='$v_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Vehicle Deleted',											
											'Controller',											
											'Vehicle Has Been Deleted by Controller.')";		
	
	$actr = mysqli_query($connect, $actsql);		
	header('location: vehicles.php');
} else {
	header('location: vehicles.php');
}
?>