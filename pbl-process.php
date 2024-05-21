<?php
include('config.php');

$vehicle_type = '1-4 Passengers';
$start_postcode = $_POST['st_post'];
$st_mile = $_POST['st_mile'];
$finish_postcode = $_POST['fn_code'];
$fn_mile = $_POST['fn_mile'];
$single_price  = $_POST['single_price'];

$sql = "INSERT INTO `price_by_location`(
										`vehicle_type`, 
										`st_post`, 
										`st_mile`, 
										`fn_post`, 
										`fn_mile`, 
										`single_price`
										) VALUES (										
										'$vehicle_type',
										'$start_postcode',
										'$st_mile',
										'$finish_postcode',
										'$fn_mile',
										'$single_price')";
$result = $connect->query($sql);
if($result){
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Price By Location ',											
											'Controller',											
											'Price By Location Has Been Added by Controller.')";		
	$actr = mysqli_query($connect, $actsql);
	header('Location: pricing.php#tabs-loc');    
	exit();   
}else{
	echo 'Error Occured';
	header('Location: pricing.php#tabs-loc');   	
}
?>