<?php
include('config.php');

$d_bank_id = $_GET['d_bank_id'];
$d_id = $_GET['d_id'];

$sql = "DELETE FROM `driver_bank_details` WHERE `d_bank_id`='$d_bank_id'";
$result = $connect->query($sql);

if($result){ 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Driver Bank Account Deleted',											
											'Controller',											
											'Driver Bank Has Been Deleted by Controller.')";		
		
	$actr = mysqli_query($connect, $actsql);
	header('Location: view-driver.php?d_id='.$d_id.'#tabs-bank');   	
} else {		
	header('Location: view-driver.php?d_id='.$d_id.'#tabs-bank');   	
}
?>