<?php
include('config.php');
include('session.php');

$book_id = $_GET['book_id'];
$status = 'Cancelled';
	
$sql = "UPDATE `bookings` SET `booking_status`='$status' WHERE `book_id`='$book_id'";
$result = $connect->query($sql);

if($result){ 		
	$activity_type = 'Booking Cancelled';			
	$user_type = 'user';        		
	$details = "Booking ID: $book_id Has been Cancelled by Controller.";			
	$actsql = "INSERT INTO `activity_log`(
											`activity_type`, 
											`user_type`, 
											`user_id`, 
											`details`
											) VALUES (
											'$activity_type',
											'$user_type',
											'$myId',
											'$details')";		
				
	$actr = mysqli_query($connect, $actsql);
	header('location: cancelled-booking.php');
} else {	
	header('location: cancelled-booking.php');
}
?>