<?php
include('config.php');
	$ap_id = $_GET['ap_id'];

	$sql = "DELETE FROM `airports` WHERE `ap_id`='$ap_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Airport has been deleted from the record')</script>";
		header('location: airports.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: airports.php');
	}
?>