<?php
require 'config.php';

$fare_id = $_POST['fare_id'];
$cpc = $_POST['cpc'];
$wc = $_POST['wc'];
$tolls = $_POST['tolls'];
$exc = $_POST['exc'];
$date = date("Y-m-d H:i:s");

$sql = "UPDATE `fares` SET
							`car_parking`='$cpc',
							`waiting`='$wc',
							`tolls`='$tolls',
							`extras`='$exc',							
							`apply_date`='$date' WHERE `fare_id`='$fare_id'";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: fare-corrections.php');    
	exit();    
} else {		
	header('Location: correction-details.php?id='.$fare_id);    
}
$connect->close();
?>
