<?php
include('config.php');
	
$c_id = $_GET['c_id'];
$sql = "DELETE FROM `clients` WHERE `c_id`='$c_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Customer Profile Deleted',											
											'Controller',											
											'Customer Profile Has Been Deleted by Controller.')";		
		
	$actr = mysqli_query($connect, $actsql);	
	header('location: customers.php');
} else {
	header('location: customers.php');
}
?>