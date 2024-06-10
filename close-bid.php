<?php
include('config.php');	
include('session.php');	
	
$book_id = $_GET['book_id'];
$status = 0;

$sql = "UPDATE `bookings` SET  `bid_status`='$status' WHERE `book_id`='$book_id'";
$result = $connect->query($sql);
	
if($result){ 
	$activity_type = 'Bid Closed';
	$user_type = 'user';
	$details = "Bid for Booking ID " . $book_id . " Has Been Closed by Controller.')";
			
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