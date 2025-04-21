<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

$ts_id = $_POST['ts_id'];
$d_id = $_POST['d_id'];
$status = 4;

if(isset($_POST['d_id']) && isset($_POST['ts_id'])) { 					
	$sql = "UPDATE `time_slots` SET `d_id`='$d_id', `ts_status`='$status' WHERE `ts_id`='$ts_id'";
	$r = mysqli_query($connect, $sql);	
		
	if($r) {
		$activity_type = 'Time slot Completed';
		$user_type = 'driver';
		$details = "Complete Time slot.";
		
		$actsql = "INSERT INTO `activity_log` (
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
		echo json_encode(array('message' => "Time Slot Completed Successfully", 'status' => true));				
	} else {    					
		echo json_encode(array('message' => "Error In Completing Time Slot", 'status' => false));			
	}						
} else {   
	echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>