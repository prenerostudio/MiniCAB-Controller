<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['bid_id'])) {
		$bid_id = $_POST['bid_id'];
        $bid_amount = $_POST['bid_amount'];       
        $date = date("Y-m-d h:i:s");
        
       
        $sql = "UPDATE `bids` SET  							
								`bid_amount`='$bid_amount',
								`bid_date`='$date' WHERE `bid_id`='$bid_id'";
        
        $result = mysqli_query($connect, $sql);
        if ($result) {    
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
