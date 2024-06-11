<?php
require 'config.php';
include('session.php');

$sp = $_POST['sp'];
$ep = $_POST['ep'];
$dis = $_POST['journey_distance'];
$fare = $_POST['fare'];
$sql = "INSERT INTO `zones`( 
							`starting_point`,							
							`end_point`, 							
							`distance`, 							
							`fare`							
							) VALUES (							
							'$sp',							
							'$ep',							
							'$dis',							
							'$fare')";                
$result = mysqli_query($connect, $sql);       
if ($result) { 
	$activity_type = 'New Zone Added';
	$user_type = 'user';
	$details = "New Zone " . $sp . " - " . $ep . " Has Been Added by Controller.";
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
	header('Location: zones.php');    
	exit();    
} else {		
	header('Location: zones.php');    
}
$connect->close();
?>