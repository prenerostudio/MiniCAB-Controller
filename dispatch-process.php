<?php
require 'config.php';
$book_id = $_POST['book_id'];
$c_id = $_POST['c_id'];
$d_id = $_POST['d_id'];
$pm = $_POST['pm'];
$pc = $_POST['pc'];
$edc = $_POST['edc'];
$dwc = $_POST['dwc'];
$fare = $_POST['fare'];
$note = $_POST['note'];
$status = 'Waiting';
$date = date("Y-m-d H:i:s");

$sql = "INSERT INTO `jobs`(
						`book_id`, 
						`c_id`, 
						`d_id`, 
						`pay_method`, 
						`parking_charges`, 
						`extra_charge`, 
						`driver_waiting_charges`, 
						`fare`, 
						`note`, 
						`job_status`, 
						`date_job_add`
						) VALUES (
						'$book_id',
						'$c_id',
						'$d_id',
						'$pm',
						'$pc',
						'$edc',
						'$dwc',
						'$fare',
						'$note',
						'$status',
						'$date')";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: dashboard.php');    
	exit();    
} else {		
	header('Location: booking.php');    
}
$connect->close();
?>
