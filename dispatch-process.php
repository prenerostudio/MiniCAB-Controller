<?php
require 'config.php';
$book_id = $_POST['book_id'];
$c_id = $_POST['c_id'];
$d_id = $_POST['d_id'];
$note = $_POST['note'];
$status = 'Waiting';
$date = date("Y-m-d H:i:s");

$sql = "INSERT INTO `jobs`(
							`book_id`, 
							`c_id`, 
							`d_id`, 
							`note`, 
							`job_status`,
							`date_job_add`
							) VALUES (
							'$book_id',
							'$c_id',
							'$d_id',
							'$note',
							'$status',							
							'$date')";                
$result = mysqli_query($connect, $sql);       
if ($result) {  
	
	$updatesql = "UPDATE `bookings` SET 
										`booking_status`='Booked',
										`book_add_date`='$date' WHERE `book_id`='$book_id'";                
$ur = mysqli_query($connect, $updatesql);  
	
	
	
	
	header('Location: dashboard.php');    
	exit();    
} else {		
	header('Location: booking.php');    
}
$connect->close();
?>
