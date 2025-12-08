<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

if(isset($_POST['d_id'])) {	
    $d_id = $_POST['d_id'];    
    $date = date("Y-m-d h:i:s");        
    $insert_break_query = "INSERT INTO `break_time` (`d_id`, `start_time`) VALUES ('$d_id', '$date')";    
    $insert_break_result = mysqli_query($connect, $insert_break_query);            
    if($insert_break_result) {       
        $break_id = mysqli_insert_id($connect);				    	
        $update_driver_query = "UPDATE `drivers` SET `status`='On-Break' WHERE `d_id`='$d_id'";    	
        $update_driver_result = mysqli_query($connect, $update_driver_query);			
        
        $activity_type = 'Break Time Started';	
        $user_type = 'driver';	
        $details = "You go to break time.";	
        $actsql = "INSERT INTO `activity_log`(`activity_type`,`user_type`,`user_id`,`details`) VALUES ('$activity_type','$user_type','$d_id','$details')";										
        $actr = mysqli_query($connect, $actsql);        
	
        echo json_encode(array('data' => $break_id, 'message' => "Driver is On Break", 'status' => true));    	       
    } else {        	
        echo json_encode(array('message' => "Error in logging break time", 'status' => false));    	        
    }	       
} else {   
    echo json_encode(array('message' => "Some fields are missing", 'status' => false));
}
?>