<?php
include('config.php');

$book_id = $_GET['book_id'];
$job_id = $_GET['job_id'];
$status = 'Pending';
$date = date("Y-m-d H:i:s");

$jsql = "DELETE FROM `jobs` WHERE `job_id`='$job_id'";
$jresult = $connect->query($jsql);

if($jresult){ 
	$bsql = "UPDATE `bookings` SET  `booking_status`='$status', `book_add_date`='$date' WHERE `book_id`='$book_id'";	
	$bresult = $connect->query($bsql);							
	echo'<br>'; 	
	echo ' '; 	
	echo "<script>alert('Job has been deleted from the record')</script>";	
	header('location: all-bookings.php');	
} else {
	echo "<script>alert('Some error occurred. Try again')</script>";	
	header('location: all-bookings.php');	
}
?>