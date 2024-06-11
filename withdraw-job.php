<?php
include('config.php');
include('session.php');

$book_id = $_GET['book_id'];
$job_id = $_GET['job_id'];
$status = 'Pending';

$jsql = "DELETE FROM `jobs` WHERE `job_id`='$job_id'";
$jresult = $connect->query($jsql);
if($jresult){ 
	$bsql = "UPDATE `bookings` SET  `booking_status`='$status' WHERE `book_id`='$book_id'";	
	$bresult = $connect->query($bsql);	
	$activity_type = 'Job Withdrawal';	
	$user_type = 'user';		
	$details = "Job " . $job_id . " Has Been Withdrawed by Controller.";	
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
	header('location: all-bookings.php');	
} else {	
	header('location: all-bookings.php');	
}
?>