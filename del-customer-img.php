<?php
include('config.php');
	
$c_id = $_GET['c_id'];
$sql = "UPDATE `clients` SET  `c_pic`=''  WHERE `c_id`='$c_id'";
$result = $connect->query($sql);
	
if($result){ 		
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Customer Image Deleted',											
											'Controller',											
											'Customer Image Has Been Deleted by Controller.')";		
		
	$actr = mysqli_query($connect, $actsql);	
	header('location: view-customer.php?c_id='.$c_id);	
} else {
	echo "<script>alert('Some error occurred. Try again')</script>";	
	header('location: view-customer.php?c_id='.$c_id);	
}
?>