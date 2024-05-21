<?php
include('config.php');

$book_id = $_GET['book_id'];
$status = 'Cancelled';
	
$sql = "UPDATE `bookings` SET `booking_status`='$status' WHERE `book_id`='$book_id'";
$result = $connect->query($sql);

if($result){ 	
	header('location: cancelled-booking.php');
} else {	
	header('location: cancelled-booking.php');
}
?>