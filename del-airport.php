<?php
include('config.php');
$ap_id = $_GET['ap_id'];
$sql = "DELETE FROM `airports` WHERE `ap_id`='$ap_id'";
$result = $connect->query($sql);
if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Airport Deleted',											
											'Controller',											
											'Airport Has Been Deleted by Controller.')";		
	$actr = mysqli_query($connect, $actsql);
	header('location: airports.php');	
} else {
	header('location: airports.php');	
}
?>