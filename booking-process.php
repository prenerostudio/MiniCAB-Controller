<?php
require 'config.php';

$pickup = $_POST['pickup'];
$destination = $_POST['destination'];
$journey_type = $_POST['journey_type'];
$passenger = $_POST['passenger'];
$luggage = $_POST['luggage'];
$note = $_POST['note'];
$c_id = $_POST['c_id'];
$pdate = $_POST['pdate'];
$ptime = $_POST['ptime'];
$distance= $_POST['dis'];
$fare = $_POST['fare'];
$status = 'Pending';
$date = date("Y-m-d H:i:s");

$sql = "INSERT INTO `bookings`(
								`c_id`, 
								`pickup`, 
								`destination`, 
								`passenger`, 
								`luggage`, 
								`note`, 
								`book_date`, 
								`book_time`, 
								`journey_type`, 
								`journey_fare`,
								`journey_distance`, 
								`booking_status`, 							 
								`book_add_date`
								) VALUES (							
								'$c_id',
								'$pickup',
								'$destination',
								'$passenger',
								'$luggage',
								'$note',
								'$pdate',
								'$ptime',
								'$journey_type',
								'$fare',
								'$distance',
								'$status',
								'$date')";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: booking.php');    
	exit();    
} else {		
	header('Location: booking.php');    
}
$connect->close();
?>
