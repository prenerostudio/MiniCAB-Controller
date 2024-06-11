<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$book_id = $_POST['book_id'];
$status = 'Cancelled';
$reason = $_POST['reason'];
$sql="UPDATE `bookings` SET `booking_status`='$status' WHERE `book_id`='$book_id'";
$r=mysqli_query($connect,$sql);
if($r){
	$bsql = "INSERT INTO `cancelled_bookings`(`book_id`, `cancel_reason`, `date_cancelled`) VALUES ('$book_id','$reason','$date')";
	$br = mysqli_query($connect,$bsql);		
	$activity_type = 'Booking Cancelled';					
	$user_type = 'client';					
	$details = "Booker Has cancelled booking Booking ID: $book_id.";						
	$actsql = "INSERT INTO `activity_log`(
										`activity_type`, 
										`user_type`, 
										`user_id`, 
										`details`
										) VALUES (
										'$activity_type',
										'$user_type',
										'$c_id',
										'$details')";	
	$actr = mysqli_query($connect, $actsql);		
	echo json_encode(array('message'=>"Booking Cancelled Successfully",'status'=>true));			
}else{    		
	echo json_encode(array('message'=>"Error In Cancel Booking",'status'=>false));			
}				
?>