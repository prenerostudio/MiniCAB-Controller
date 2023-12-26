<?php
include('config.php');
	$des_id = $_GET['des_id'];

	$sql = "DELETE FROM `destinations` WHERE `des_id`='$des_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Destination has been deleted from the record')</script>";
		header('location: destinations.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: destinations.php');
	}
?>