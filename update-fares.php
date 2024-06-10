<?php
require 'config.php';
include('session.php');


$fare_id = $_POST['fare_id'];
$cpc = $_POST['cpc'];
$wc = $_POST['wc'];
$tolls = $_POST['tolls'];
$exc = $_POST['exc'];

$sql = "UPDATE `fares` SET
							`car_parking`='$cpc',
							`waiting`='$wc',
							`tolls`='$tolls',
							`extras`='$exc' WHERE `fare_id`='$fare_id'";                
$result = mysqli_query($connect, $sql);       
if ($result) { 	
	$activity_type = 'Booking Fares Updated';	
	$user_type = 'user';	
	$details = "Booking Fare Has Been updated by Controller.";	
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
	header('Location: fare-corrections.php');    
	exit();    
} else {		
	header('Location: correction-details.php?id='.$fare_id);    
}
$connect->close();
?>
