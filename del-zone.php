<?php
include('config.php');
	
$zone_id = $_GET['z_id'];
$sql = "DELETE FROM `zones` WHERE `zone_id`='$zone_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Zone Deleted ',											
											'Controller',											
											'Zone Address Has Been Deleted by Controller.')";		
	
	$actr = mysqli_query($connect, $actsql);
	header('location: zones.php');
} else {
	header('location: zones.php');
}
?>