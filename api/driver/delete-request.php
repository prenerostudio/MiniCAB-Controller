<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");


if(isset($_POST['d_id'])) {

    $d_id = $_POST['d_id'];

    $request_msg = $_POST['request_msg'];

    $req_status = 0;
	

    $delete_account_query = "INSERT INTO `delete_drivers`(
							`d_id`, 
							`request_msg`, 
							`req_status`
							) VALUES (
							'$d_id',
							'$request_msg',
							'$req_status')";    

    $delete_account_result = mysqli_query($connect, $delete_account_query);            
	

    if($delete_account_result) {

        $activity_type = 'Delete Account Request';
	
        $user_type = 'driver';
	
        $details = "Delete Account Request Pending.";
	
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
	
        echo json_encode(array('message' => "Driver request of acount deletion.", 'status' => true));    
	
        
    } else {        
	
        echo json_encode(array('message' => "Error in logging break time", 'status' => false));    
	}	       
} else {   
    
    echo json_encode(array('message' => "Some fields are missing", 'status' => false));
}
?>