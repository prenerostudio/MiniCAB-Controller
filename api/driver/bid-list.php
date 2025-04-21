<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$sql="SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, vehicles.* FROM bookings JOIN clients ON bookings.c_id = clients.c_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE bookings.bid_status = 1 ORDER BY bookings.bid_time ASC";	
$r=mysqli_query($connect,$sql);
$output=mysqli_fetch_all($r,MYSQLI_ASSOC);
if(count($output)>0){    				    		
	echo json_encode(array('data'=>$output, 'status'=>true));
}else{    
	echo json_encode(array('message'=>'No Bid Found','status'=>false));
}
?>