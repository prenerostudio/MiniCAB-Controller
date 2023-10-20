<?php
include('config.php');
	$c_id = $_GET['id'];

	$sql = "DELETE FROM `clients` WHERE `c_id`='$c_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Client has been deleted from the record')</script>";
		header('location: clients.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: clients.php');
	}
?>