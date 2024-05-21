<?php
include('config.php');
	
$v_id = $_GET['v_id'];
$sql = "UPDATE `vehicles` SET `v_img`='' WHERE `v_id`='$v_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Vehicle Image Delete ',											
											'Controller',											
											'Vehicle Image Has Been Accepted by Controller.')";		
	
	$actr = mysqli_query($connect, $actsql);		
	header('Location: view-vehicle.php?v_id='.$v_id);
} else {
	header('Location: view-vehicle.php?v_id='.$v_id);
}
?>