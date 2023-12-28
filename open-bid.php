<?php
include('config.php');
	

$book_id = $_GET['book_id'];
$status = 1;
$date = date("Y-m-d H:i:s");

	$sql = "UPDATE `bookings` SET  `bid_status`='$status', `book_add_date`='$date' WHERE `book_id`='$book_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Bid Has Been Placed Successfully!')</script>";
		header('location: bid-bookings.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: bid-bookings.php');
	}
?>