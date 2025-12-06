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
        $status = $_POST['status']; 
		$date = date('Y-m-d H:i:s');
        $sql = "UPDATE `drivers` SET `status`='$status' WHERE `d_id`='$d_id'";        		
        $result = mysqli_query($connect, $sql);
        if ($result) {  
			
		
			if ($status == 'online') {
    
				$osql = "INSERT INTO `driver_sessions`(`d_id`, `driver_online_at`) VALUES ('$d_id','$date')";

			} else {
    
				$osql = "UPDATE `driver_sessions` SET `driver_offline_at`='$date' WHERE `d_id`='$d_id'";

			}
 
			$r = mysqli_query($connect, $osql);												
			$activity_type = 'Status Updated';		
			$user_type = 'driver';		
			$details = "Your Status recently Updated";				
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
			
			
			$response = array('message' => "Status Update Successfully", 'status' => true);
            echo json_encode($response);
        } else {    
            $response = array('message' => "Error In updating Status", 'status' => false);
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