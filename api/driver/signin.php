<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_phone = $_POST['d_phone'];
$d_password=$_POST['d_password'];

if(isset($_POST['d_phone'])){
	$sql="SELECT * FROM `drivers` WHERE `d_phone`='$d_phone' AND `d_password`='$d_password'";
	$r=mysqli_query($connect,$sql);	
	if($r){    	
		$output=$r->fetch_assoc();
		$d_id = $output['d_id'];
		$activity_type = 'Account Logged In';
		$user_type = 'driver';
		$details = "You Have Logged in to your account.";
		$actsql = "INSERT INTO `activity_log`(
											`activity_type`, 
											`user_type`, 
											`user_id`, 
											`details`
											) VALUES (
											'$activity_type',
											'$user_type',
											'$d_id',
											'$details')";		
									
		$actr = mysqli_query($connect, $actsql);						
		echo json_encode(array('data'=>$output, 'message'=>'User Logged in Successfully','status'=>true));
	}else{    
		echo json_encode(array('message'=>'User Does Not Exist','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>