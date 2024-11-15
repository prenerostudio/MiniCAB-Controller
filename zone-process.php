<?php
require 'config.php';
include('session.php');

$za = $_POST['za'];

$sql = "INSERT INTO `zones`(
							`zone_name`
							) VALUES (
							'$za')";                
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