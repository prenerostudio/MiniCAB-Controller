<?php
include('config.php');
	$dt_id = $_GET['dt_id'];

	$sql = "DELETE FROM `special_dates` WHERE `dt_id`='$dt_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Date has been deleted from the record')</script>";
		header('location: special-dates.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: special-dates.php');
	}
?>