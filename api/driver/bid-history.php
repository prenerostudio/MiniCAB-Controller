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
      
        
       
       $sql="SELECT bids.*, booking_bid.*, bookings.*, drivers.* FROM bids, booking_bid, bookings, drivers WHERE bids.bid_book_id = booking_bid.bid_book_id AND booking_bid.book_id = bookings.book_id AND bids.d_id = drivers.d_id AND bids.d_id = '$d_id'";	
        
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