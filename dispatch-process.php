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
$job_status  = 'Pending';
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
	$bsql="UPDATE `bookings` SET `booking_status`='$book_status', `book_add_date`='$date' WHERE `book_id`='$book_id'";
	$r = mysqli_query($connect, $bsql); 
	header('Location: all-bookings.php');    
	exit();    
} else {		
	header('Location: view-booking.php?book_id='.$book_id);    
}
$connect->close();
?>
