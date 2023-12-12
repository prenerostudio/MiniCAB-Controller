<?php
include('config.php');
	$mg_id = $_GET['id'];

	$sql = "DELETE FROM `mg_charges` WHERE `mg_id`='$mg_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Location has been deleted from the record')</script>";
		header('location: pricing.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: pricing.php');
	}
?>