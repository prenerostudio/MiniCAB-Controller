<?php
require 'config.php';
include('session.php');

$ap_name = $_POST['ap_name'];
$ap_address = $_POST['ap_address'];
$sql = "INSERT INTO `airports`(
								`ap_name`, 
								`ap_address`							
								) VALUES (
								'$ap_name',
								'$ap_address')";                

$result = mysqli_query($connect, $sql);       
if ($result) {  
	$activity_type = 'New Airport Added';		
	$user_type = 'user';        	
	$details = "New Airport $ap_name Has been Added by Controller.";
			
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
	header('Location: airports.php');    		
} else {		
	header('Location: airports.php');    
}
$connect->close();
?>