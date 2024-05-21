<?php
include('config.php');
	
$book_id = $_GET['book_id'];
$status = 1;
$date = date("Y-m-d H:i:s");

$sql = "UPDATE `bookings` SET  `bid_status`='$status', `book_add_date`='$date' WHERE `book_id`='$book_id'";	
$result = $connect->query($sql);

if($result){ 		
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Bid Opened',											
											'Controller',											
											'Bid Against Booking ID " . $book_id . " Has Been Opened by Controller.')";		
	
	$actr = mysqli_query($connect, $actsql);	
	header('location: bid-bookings.php');	
} else {	
	header('location: bid-bookings.php');	
}
?>