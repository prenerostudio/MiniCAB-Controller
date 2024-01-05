<?php
include('config.php');
	$d_id = $_GET['d_id'];

	$sql = "UPDATE `drivers` SET  `d_pic`=''  WHERE `d_id`='$d_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Driver Img has been removed from the record')</script>";
		header('location: view-driver.php?d_id='.$d_id);
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: view-driver.php?d_id='.$d_id);
	}
?>