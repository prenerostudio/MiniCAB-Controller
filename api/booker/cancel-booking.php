<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$book_id = $_POST['book_id'];
$status = 'Cancelled';
$date = date("Y-m-d h:i:s");
				
$sql="UPDATE `bookings` SET `booking_status`='$status', `book_add_date`='$date' WHERE `book_id`='$book_id'";								

$r=mysqli_query($connect,$sql);		

if($r){    			
	echo json_encode(array('message'=>"Booking Cancelled Successfully",'status'=>true));			
}else{    		
	echo json_encode(array('message'=>"Error In Cancel Booking",'status'=>false));			
}				
?>