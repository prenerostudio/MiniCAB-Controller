<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['c_id'])) {
		$c_id = $_POST['c_id'];
        $status = $_POST['status'];               
               
        $sql = "UPDATE `clients` SET `status`='$status' WHERE `c_id`='$c_id'";        
		
        $result = mysqli_query($connect, $sql);
        if ($result) {  
			
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
