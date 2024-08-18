<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id = $_POST['c_id'];
$c_phone = $_POST['c_phone'];
$date = date("Y-m-d h:i:s");
				
$sql="UPDATE `clients` SET `c_phone`='$c_phone',`reg_date`='$date' WHERE `c_id`='$c_id'";								

$r=mysqli_query($connect,$sql);		

if($r){  
	$activity_type = 'Phone Number Changed';					
	$user_type = 'client';					
	$details = "Booker changed his Phone Number";					
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
	echo json_encode(array('message'=>"Phone Number Updated Successfully",'status'=>true));			
}else{    		
	echo json_encode(array('message'=>"Error In Updating Phone Number",'status'=>false));			
}				
?>