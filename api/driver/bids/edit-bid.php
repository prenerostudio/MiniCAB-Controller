<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['bid_id'])) {
		$bid_id = $_POST['bid_id'];
        $bid_amount = $_POST['bid_amount'];
		$d_id = $_POST['d_id'];
        
        $sql = "UPDATE `bids` SET  							
								`bid_amount`='$bid_amount' WHERE `bid_id`='$bid_id'";
        
        $result = mysqli_query($connect, $sql);
        if ($result) {    
			$activity_type = 'Bid Amount Updated';        
			$user_type = 'driver';        
			$details = "Bid Amount $bid_amount Updated against Bid # $bid_id.";

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
			
            $response = array('message' => "Bid Updated Successfully", 'status' => true);
            echo json_encode($response);
        } else {    
            $response = array('message' => "Error In Placing Bid", 'status' => false);
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
