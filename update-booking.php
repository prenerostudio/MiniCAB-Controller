<?php
require 'config.php';
$book_id = $_POST['book_id'];
$pickup = $_POST['pickup'];
$destination = $_POST['destination'];
$v_id = $_POST['v_id'];
$journey_type = $_POST['journey_type'];
$passenger = $_POST['passenger'];
$luggage = $_POST['luggage'];
$note = $_POST['note'];
$c_id = $_POST['c_id'];
$pdate = $_POST['pdate'];
$ptime = $_POST['ptime'];
$status = 'Pending';
$date = date("Y-m-d H:i:s");

$sql = "UPDATE `bookings` SET 
							`c_id`='$c_id',
							`pickup`='$pickup',
							`destination`='$destination',
							`passenger`='$passenger',
							`luggage`='$luggage',
							`note`='$note',
							`book_date`='$pdate',
							`book_time`='$ptime',
							`journey_type`='$journey_type',
							`v_id`='$v_id',
							`booking_status`='$status',
							`book_add_date`='$date' WHERE `book_id`='$book_id'";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: booking.php');    
	exit();    
} else {		
	header('Location: booking.php');    
}
$connect->close();
?>
