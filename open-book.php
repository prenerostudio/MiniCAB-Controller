<?php
include('config.php');
include('session.php');
	

$book_id = $_GET['book_id'];

$status = 'Open';

$sql = "UPDATE `bookings` SET `booking_status`='$status' WHERE `book_id`='$book_id'";	
$result = $connect->query($sql);


if($result){ 	

    $activity_type = 'Booking Opened';	

    $user_type = 'user';	

    $details = "Booking ID " . $book_id . " Has Been Opened by Controller.";
	

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

    header('location: open-bookings.php');	
} else {	

    header('location: open-bookings.php');	
}
?>