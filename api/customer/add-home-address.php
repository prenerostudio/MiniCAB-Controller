<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$c_id = $_POST['c_id'];
$address = $_POST['address'];


if (isset($_POST['c_id'])) {	
	$sql="INSERT INTO `customers_address`(
									`c_id`, 
									`address`
									) VALUES (
									'$c_id',
									'$address')";								

	$r=mysqli_query($connect,$sql);		
	if($r){
		$activity_type = 'Customer Address Added';		
		$user_type = 'client';		
		$details = "Customer Has added New Address.";		
		$actsql = "INSERT INTO `activity_log`(
										`activity_type`, 
										`user_type`, 
										`user_id`, 
										`details`
										) VALUES (
										'$activity_type',
										'$user_type',
										'$c_id',
										'$details')";		
		$actr = mysqli_query($connect, $actsql);			
		echo json_encode(array('message'=>"Home Address Added Successfully",'status'=>true));			
	}else{    		
		echo json_encode(array('message'=>"Error In adding Home Address",'status'=>false));			
	}		
} else {
	echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>