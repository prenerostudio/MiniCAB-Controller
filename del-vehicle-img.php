<?php
include('config.php');
	$v_id = $_GET['v_id'];

	$sql = "UPDATE `vehicles` SET `v_img`='' WHERE `v_id`='$v_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Customer Img has been removed from the record')</script>";
		header('Location: view-vehicle.php?v_id='.$v_id);
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('Location: view-vehicle.php?v_id='.$v_id);
	}
?>