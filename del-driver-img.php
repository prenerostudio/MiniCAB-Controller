<?php
include('config.php');
	
$d_id = $_GET['d_id'];
$sql = "UPDATE `drivers` SET  `d_pic`=''  WHERE `d_id`='$d_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Driver Profile Image Deleted',											
											'Controller',											
											'Driver Profile Image Has Been Deleted by Controller.')";		
		
	$actr = mysqli_query($connect, $actsql);
	header('location: view-driver.php?d_id='.$d_id);
} else {	
	header('location: view-driver.php?d_id='.$d_id);
}
?>