<?php
include('config.php');
	
$dt_id = $_GET['dt_id'];
$sql = "DELETE FROM `special_dates` WHERE `dt_id`='$dt_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Special Date Deleted',											
											'Controller',											
											'Special Date Has Been Deleted by Controller.')";		
		
	$actr = mysqli_query($connect, $actsql);	
	header('location: special-dates.php');
} else {
	header('location: special-dates.php');
}
?>