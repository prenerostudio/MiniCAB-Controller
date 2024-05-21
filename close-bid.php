<?php
include('config.php');
	
$book_id = $_GET['book_id'];
$status = 0;

$sql = "UPDATE `bookings` SET  `bid_status`='$status' WHERE `book_id`='$book_id'";
$result = $connect->query($sql);
	
if($result){ 
	$actsql = "INSERT INTO `activity_log` (
	
										`activity_type`,
										`user`,											
										`details`
										) VALUES (											
										'Bid Closed ',
										'Controller',											
										'Bid for Booking ID " . $book_id . " Has Been Closed by Controller.')";		
	
	$actr = mysqli_query($connect, $actsql);
	header('location: bid-bookings.php');
} else {
	header('location: bid-bookings.php');
}
?>