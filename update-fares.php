<?php
require 'config.php';

$fare_id = $_POST['fare_id'];
$ewc = $_POST['ewc'];
$pkc = $_POST['pkc'];
$tolls = $_POST['tolls'];
$date = date("Y-m-d H:i:s");

$sql = "UPDATE `fares` SET  `extra_waiting`='$ewc',
							`parking`='$pkc',
							`tolls`='$tolls',
							`apply_date`='$date' WHERE `fare_id`='$fare_id'";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: fare-correction.php');    
	exit();    
} else {		
	header('Location: correction-details.php');    
}
$connect->close();
?>
