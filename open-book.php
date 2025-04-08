<?php
include('config.php');
include('session.php');
	
$book_id = $_GET['book_id'];
$status = 'Open';
$date_update = date('Y-m-d H:i:s'); // Current timestamp
$sql = "UPDATE `bookings` SET `booking_status`='$status' WHERE `book_id`='$book_id'";	
$result = $connect->query($sql);
if($result){ 	       
    $sql = "INSERT INTO `open-bookings`(`book_id`, `ob_status`, `ob_created_at`) VALUES ('$book_id','$status','$date_update')";	
    $result = $connect->query($sql);        
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