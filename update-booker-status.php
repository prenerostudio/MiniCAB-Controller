<?php
include('config.php');
	
$c_id = $_GET['c_id'];
$status = 1;	
$sql = "UPDATE `clients` SET  `acount_status`='$status' WHERE `c_id`='$c_id'";
$result = $connect->query($sql);
if($result){ 	
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Booker Verified',											
											'Controller',											
											'Booker " . $c_id . " Has Been Verified by Controller.')";				
	$actr = mysqli_query($connect, $actsql);			
	header('location: view-booker.php?c_id='.$c_id);	
} else {	
	header('location: view-booker.php?c_id='.$c_id);
}
?>