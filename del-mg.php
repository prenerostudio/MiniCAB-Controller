<?php
include('config.php');
	
$mg_id = $_GET['mg_id'];
$sql = "DELETE FROM `mg_charges` WHERE `mg_id`='$mg_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Meet & Greet Charges Deleted',											
											'Controller',											
											'Meet & Greet Charges Has Been Deleted by Controller.')";		
		
	$actr = mysqli_query($connect, $actsql);		
	header('location: pricing.php');
} else {
	header('location: pricing.php');
}
?>