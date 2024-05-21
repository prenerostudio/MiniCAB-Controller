<?php
require 'config.php';

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
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`, 											
											`details`											
											) VALUES (											
											'New Airport Added',											
											'Controller',											
											'New Airport " . $ap_name . " Has been Added by Controller')";		
				
	$actr = mysqli_query($connect, $actsql);	
	header('Location: airports.php');    		
} else {		
	header('Location: airports.php');    
}
$connect->close();
?>