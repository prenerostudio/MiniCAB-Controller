<?php
include('config.php');
	$d_id = $_GET['d_id'];
$status = 1;
$date = date("Y-m-d H:i:s");

	$sql = "UPDATE `drivers` SET  `acount_status`='$status',`driver_reg_date`='$date' WHERE `d_id`='$d_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Driver has been Updates from the record')</script>";
		header('location: drivers.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: drivers.php');
	}
?>