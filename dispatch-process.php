<?php
include('config.php');

$book_id = $_POST['book_id'];
$c_id  = $_POST['c_id'];
$d_id	= $_POST['d_id'];
$job_note = $_POST['job_note'];
$journey_fare = $_POST['journey_fare'];
$booking_fee = $_POST['booking_fee'];
$car_parking  = $_POST['car_parking'];
$waiting = $_POST['waiting'];
$tolls  = $_POST['tolls'];
$extra  = $_POST['extra'];
$job_status  = 'waiting';
$date = date("Y-m-d H:i:s");

$sql = "INSERT INTO `jobs`(
							`book_id`, 
							`c_id`, 
							`d_id`, 
							`job_note`, 
							`journey_fare`, 
							`booking_fee`, 
							`car_parking`, 
							`waiting`, 
							`tolls`, 
							`extra`, 
							`job_status`, 
							`date_job_add`
							) VALUES (
							'$book_id',
							'$c_id',
							'$d_id',
							'$job_note',
							'$journey_fare',
							'$booking_fee',
							'$car_parking',
							'$waiting',
							'$tolls',
							'$extra',
							'$job_status',
							'$date')";                
$result = mysqli_query($connect, $sql);       
if ($result) {  
	$book_status='Booked';
	$bsql="UPDATE `bookings` SET `booking_status`='$book_status' WHERE `book_id`='$book_id'";
	$r = mysqli_query($connect, $bsql); 
	
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Job Dispatched ',											
											'Controller',											
											'Job Has been dispatched to driver by Controller.')";		
	$actr = mysqli_query($connect, $actsql);
	header('Location: upcoming-bookings.php');    
	exit();    
} else {		
	header('Location: view-booking.php?book_id='.$book_id);    
}
$connect->close();
?>
