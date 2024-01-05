<?php
include('config.php');

$book_id = $_GET['book_id'];
$status = 'Cancelled';
$date = date("Y-m-d H:i:s");


	$sql = "UPDATE `bookings` SET `booking_status`='$status', `book_add_date`='$date' WHERE `book_id`='$book_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Booking has been Cancelled from the record')</script>";
		header('location: cancelled-booking.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: cancelled-booking.php');
	}
?>