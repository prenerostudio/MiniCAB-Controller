<?php
include('config.php');
	$d_id = $_GET['d_id'];

	$sql = "DELETE FROM `drivers` WHERE `d_id`='$d_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Driver has been deleted from the record')</script>";
		header('location: drivers.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: drivers.php');
	}
?>