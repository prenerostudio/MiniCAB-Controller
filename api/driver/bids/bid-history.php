<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	if (isset($_POST['d_id'])) {
		$d_id = $_POST['d_id'];                      
		$sql="SELECT bids.*, bookings.*, drivers.d_name, drivers.d_email, drivers.d_phone, clients.c_name, clients.c_email, clients.c_phone FROM bids, bookings, drivers, clients WHERE bids.book_id = bookings.book_id AND bids.d_id = drivers.d_id AND bookings.c_id = clients.c_id AND bids.d_id = '$d_id' ORDER BY bids.bid_id DESC";        
        $r = mysqli_query($connect, $sql);				
		$output=mysqli_fetch_all($r,MYSQLI_ASSOC);        
		if ($r) {    						        
			$response = array('data'=>$output, 'message' => "Bid Fetech Successfully", 'status' => true);
			echo json_encode($response);
        } else {    			
			$response = array('message' => "Error In Fetching Bid", 'status' => false);
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