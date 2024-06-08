<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];
$new_pass = $_POST['new_pass'];

if(isset($_POST['d_id'])){ 
	$sql="UPDATE `drivers` SET `d_password`='$new_pass' WHERE `d_id`='$d_id'";
	$r=mysqli_query($connect,$sql);
		
	if($r){    
		$activity_type = 'Password Updated';			
		$user_type = 'driver';		
		$details = "You have recently change you password";
		
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
		echo json_encode(array('message'=>"Password Change Successfully",'status'=>true));
	}else{
		echo json_encode(array('message'=>"Error In Changing Password",'status'=>false));
	}
}else{
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));

}
?>