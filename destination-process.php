<?php
require 'config.php';
include('session.php');

$des_name = $_POST['des_name'];
$des_address = $_POST['des_address'];

$sql = "INSERT INTO `destinations`(
									`des_name`, 
									`des_address`
									) VALUES (								
									'$des_name',
									'$des_address')";                
$result = mysqli_query($connect, $sql);       
if ($result) { 	
	$activity_type = 'New Destination Added';	
	$user_type = 'user';	
	$details = "New Destination Has Been Added by Controller.";
	
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
	header('Location: destinations.php');    
	exit();    
} else {		
	header('Location: destinations.php');    
}
$connect->close();
?>