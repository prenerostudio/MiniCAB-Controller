<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$bid_book_id = $_POST['bid_book_id'];

if(isset($_POST['bid_book_id'])){		
	
	 $sql="SELECT booking_bid.*, clients.c_name, clients.c_email, clients.c_phone, bookings.* FROM booking_bid, bookings, clients
WHERE booking_bid.book_id = bookings.book_id AND bookings.c_id = clients.c_id AND booking_bid.bid_status = 'Open' AND booking_bid.bid_book_id = '$bid_book_id'";	

	$r=mysqli_query($connect,$sql);
	
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);
	
	
	if(count($output)>0){    				    		
		echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Job List Fetch Successfully"));
	}else{    
		echo json_encode(array('message'=>'User Does Not Exist','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>