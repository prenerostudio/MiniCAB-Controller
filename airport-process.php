<?php
require 'config.php';

$ap_name = $_POST['ap_name'];
$ap_address = $_POST['ap_address'];
$ap_city = $_POST['ap_city'];
$ap_code = $_POST['ap_code'];

$sql = "INSERT INTO `airports`(
								`ap_name`, 
								`ap_address`, 
								`ap_city`, 
								`ap_code`								
								) VALUES (
								'$ap_name',
								'$ap_address',
								'$ap_city',
								'$ap_code')";                

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