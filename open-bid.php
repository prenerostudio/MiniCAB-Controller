<?php
include('config.php');
include('session.php');
	
$book_id = $_GET['book_id'];
$status = 1;

$sql = "UPDATE `bookings` SET  `bid_status`='$status' WHERE `book_id`='$book_id'";	
$result = $connect->query($sql);

if($result){ 	
	$activity_type = 'Bid Opened';	
	$user_type = 'user';	
	$details = "Bid Against Booking ID " . $book_id . " Has Been Opened by Controller.";
	
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
	header('location: bid-bookings.php');	
} else {	
	header('location: bid-bookings.php');	
}
?>