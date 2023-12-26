<?php
include('config.php');
	$v_id = $_GET['v_id'];

	$sql = "DELETE FROM `vehicles` WHERE `v_id`='$v_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Vehicle has been deleted from the record')</script>";
		header('location: vehicles.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: vehicles.php');
	}
?>