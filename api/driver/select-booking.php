<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$ob_id = $_POST['ob_id'];
$d_id  = $_POST['d_id'];
$status = 'Selected'; 
$date_update = date('Y-m-d H:i:s');

if(isset($_POST['d_id'])){			
	$usql = "UPDATE `open-bookings` SET `d_id`='$d_id',`ob_status`='$status',`ob_updated_at`='$date_update' WHERE `ob_id`='$ob_id'";		
	$ur=mysqli_query($connect,$usql);
			
	if($ur){   				
		
		
		$activity_type = 'Booking Selected';			
		$user_type = 'driver';		
		$details = "Booking has been Selected by Driver.";
		
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
		echo json_encode(array('message'=>'Booking Has Been Selected','status'=>true));
	}else{    
		echo json_encode(array('message'=>'No Record Found','status'=>false));
	}
}else{
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>