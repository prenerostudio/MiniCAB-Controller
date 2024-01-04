<?php
include('config.php');
	$c_id = $_GET['c_id'];

	$sql = "UPDATE `clients` SET  `c_pic`=''  WHERE `c_id`='$c_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Customer Img has been removed from the record')</script>";
		header('location: view-customer.php?c_id='.$c_id);
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: view-customer.php?c_id='.$c_id);
	}
?>