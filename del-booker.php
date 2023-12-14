<?php
include('config.php');
	$b_id = $_GET['id'];

	$sql = "DELETE FROM `bookers` WHERE `b_id`='$b_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Booker has been deleted from the record')</script>";
		header('location: bookers.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: bookers.php');
	}
?>