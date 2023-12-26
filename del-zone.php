<?php
include('config.php');
	$zone_id = $_GET['z_id'];

	$sql = "DELETE FROM `zones` WHERE `zone_id`='$zone_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Zone has been deleted from the record')</script>";
		header('location: zones.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: zones.php');
	}
?>