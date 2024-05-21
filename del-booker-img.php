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
											'Booker Image Deleted',											
											'Controller',											
											'Booker Image Has Been Deleted by Controller.')";		
			
	$actr = mysqli_query($connect, $actsql);				 
	header('location: view-booker.php?b_id='.$b_id);	
} else {				 
	header('location: view-booker.php?b_id='.$b_id);	
}
?>