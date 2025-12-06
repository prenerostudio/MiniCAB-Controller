<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['d_id'])) {
		$d_id = $_POST['d_id'];
        $job_id = $_POST['job_id'];

		$waiting_time = $_POST['waiting_time'];
        
       
        $sql = "INSERT INTO `waiting_time`(											
											`d_id`, 
											`job_id`, 
											`waiting_time`
											) VALUES (											
											'$d_id',
											'$job_id',
											'$waiting_time')";
        
        $result = mysqli_query($connect, $sql);
        if ($result) {   			
			$activity_type = 'Waiting Time for Passeger';
			$user_type = 'driver';
			$details = "Driver wait $waiting_time for the passenger against Booking # $job_id";
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
			
            $response = array('message' => "Waiting time saved Successfully", 'status' => true);
            echo json_encode($response);
        } else {    
            $response = array('message' => "Error In saving waiting time", 'status' => false);
            echo json_encode($response);
        }
    } else {
        $response = array('message' => "Some Fields are missing", 'status' => false);
        echo json_encode($response);
    }
} else {
    $response = array('message' => "Invalid Request Method", 'status' => false);
    echo json_encode($response);
}
?>
