<?php
include('config.php');
	
$des_id = $_GET['des_id'];
$sql = "DELETE FROM `destinations` WHERE `des_id`='$des_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Destination Deleted',											
											'Controller',											
											'Destination Has Been Deleted by Controller.')";		
		
	$actr = mysqli_query($connect, $actsql);
	header('location: destinations.php');
} else {
	header('location: destinations.php');
}
?>