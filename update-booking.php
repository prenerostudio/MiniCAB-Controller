<?php
include('config.php');
include('session.php');

$book_id = $_POST['book_id'];
$b_type_id = $_POST['b_type_id'];
$c_id  = $_POST['c_id'];
$pickup = $_POST['pickup'];
$dropoff = $_POST['dropoff'];
$address = $_POST['address'];
$postal_code = $_POST['postal_code'];
$passenger = $_POST['passenger'];
$pick_date  = $_POST['pick_date'];
$pick_time  = $_POST['pick_time'];
$journey_type  = $_POST['journey_type'];
$v_id = $_POST['v_id'];
$luggage  = $_POST['luggage'];
$child_seat = $_POST['child_seat'];
$flight_number = $_POST['flight_number'];
$delay_time = $_POST['delay_time'];
$note = $_POST['note'];
$journey_fare = $_POST['journey_fare'];
$journey_distance = $_POST['journey_distance'];
$booking_fee = $_POST['booking_fee'];
$car_parking  = $_POST['car_parking'];
$waiting = $_POST['waiting'];
$tolls  = $_POST['tolls'];
$extra  = $_POST['extra'];
$booking_status  = 'Pending';

$sql = "UPDATE `bookings` SET  
							`b_type_id`='$b_type_id',
							`c_id`='$c_id',
							`pickup`='$pickup',
							`destination`='$dropoff',
							`address`='$address',
							`postal_code`='$postal_code',
							`passenger`='$passenger',
							`pick_date`='$pick_date',
							`pick_time`='$pick_time',
							`journey_type`='$journey_type',
							`v_id`='$v_id',
							`luggage`='$luggage',
							`child_seat`='$child_seat',
							`flight_number`='$flight_number',
							`delay_time`='$delay_time',
							`note`='$note',
							`journey_fare`='$journey_fare',
							`journey_distance`='$journey_distance',
							`booking_fee`='$booking_fee',
							`car_parking`='$car_parking',
							`waiting`='$waiting',
							`tolls`='$tolls',
							`extra`='$extra' WHERE `book_id`='$book_id'";                

$result = mysqli_query($connect, $sql);       
if ($result) {	
	$activity_type = 'Booking Updated';	
	$user_type = 'user';	
	$details = "Booking " . $book_id . " Has Been Updated by Controller.";	
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
	header('Location: view-booking.php?book_id='.$book_id);    
	exit();    
} else {		
	header('Location: view-booking.php?book_id='.$book_id);    
}
$connect->close();
?>