<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id = $_POST['c_id'];
$commission_type = $_POST['commission_type'];
$fixed = $_POST['fixed'];
$percentage = $_POST['percentage'];
if($commission_type==1){	
	$sql="UPDATE `clients` SET 
							`commission_type`= 1,
							`percentage`='$percentage' WHERE `c_id`='$c_id'";			
}elseif($commission_type==2){						
	$sql="UPDATE `clients` SET  
							`commission_type`= 2,
							`fixed`='$fixed' WHERE `c_id`=$c_id";
}	
$r=mysqli_query($connect,$sql);		
if($r){    		
	$activity_type = 'Commission Added';	
	$user_type = 'client';	
	$details = "Commission has added to booker's account.";	
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
	echo json_encode(array('message'=>"Commission Added Successfully",'status'=>true));			
}else{    		
	echo json_encode(array('message'=>"Error In adding Commission",'status'=>false));			
}				
?>