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
        $book_id = $_POST['book_id'];
        $bid_amount = $_POST['bid_amount']; 
        
       
        $sql = "INSERT INTO `bids`(
									`book_id`, 
									`d_id`, 
									`bid_amount`									
									) VALUES (
									'$book_id',
									'$d_id',
									'$bid_amount')";
        
        $result = mysqli_query($connect, $sql);
        if ($result) {   

			
			$fsql = "SELECT `d_name` FROM `drivers` WHERE `d_id`='$d_id'";
			$fetch = mysqli_query($connect, $fsql);
			$output=$fetch->fetch_assoc();   
			$d_name = $output['d_name'];
			
			$actsql = "INSERT INTO `activity_log` (
													`activity_type`,
													`user`, 
													`details`
													) VALUES (
													'Bid Placed By Driver ',
													'$d_name',
													'New Driver Acount Created by " . $d_name . "')";		
		
			$actr = mysqli_query($connect, $actsql);
			
			
			
            $response = array('message' => "Bid Placed Successfully", 'status' => true);
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
