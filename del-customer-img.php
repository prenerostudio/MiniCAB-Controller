<?php
include('config.php');
include('session.php');
	
$c_id = $_GET['c_id'];
$sql = "UPDATE `clients` SET  `c_pic`=''  WHERE `c_id`='$c_id'";
$result = $connect->query($sql);
	
if($result){ 		
	$activity_type = 'Customer Image Deleted';	
	$user_type = 'user';	
	$details = "Customer Image Has Been Deleted by Controller.";
	
	$actsql = "INSERT INTO `activity_log`(
										`activity_type`, 
										`user_type`, 
										`user_id`, 
										`details`
										) VALUES (
										'$activity_type',
										'$user_type',
										'$myId',
										'$details')";
	$actr = mysqli_query($connect, $actsql);	
	header('location: view-customer.php?c_id='.$c_id);	
} else {
	echo "<script>alert('Some error occurred. Try again')</script>";	
	header('location: view-customer.php?c_id='.$c_id);	
}
?>