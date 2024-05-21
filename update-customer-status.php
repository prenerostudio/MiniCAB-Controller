<?php
include('config.php');

$c_id = $_GET['id'];
$status = 1;
$sql = "UPDATE `clients` SET  `acount_status`='$status',`reg_date`='$date' WHERE `c_id`='$c_id'";
$result = $connect->query($sql);

if($result){ 		
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Customer Verified',											
											'Controller',											
											'Customer " . $c_id . " Has Been Verified by Controller.')";		
	
	$actr = mysqli_query($connect, $actsql);
	header('location: customers.php');	
} else {	
	header('location: customers.php');	
}
?>