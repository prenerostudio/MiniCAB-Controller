<?php
include('config.php');

$fare_id = $_GET['id'];
$status= 'Corrected';
$date = date("Y-m-d H:i:s");
	
$sql = "UPDATE `fares` SET 
						`fare_status`='$status',
						`apply_date`='$date' WHERE `fare_id`='$fare_id'";
	
$result = $connect->query($sql);	
if($result){ 	
	echo'<br>'; 	
	echo ' '; 	
	echo "<script>alert('Fare Approved Successfully')</script>";		
	header('location: fare-corrections.php');	
} else {	
	echo "<script>alert('Some error occurred. Try again')</script>";		
	header('location: fare-corrections.php');
}
?>