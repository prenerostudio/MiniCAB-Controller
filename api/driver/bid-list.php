<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");



$sql="SELECT
	bookings.*, 
	clients.c_name, 
	clients.c_email, 
	clients.c_phone, 
	vehicles.v_name, 
	vehicles.v_pricing, 
	vehicles.v_img
FROM
	bookings,
	clients,
	vehicles
WHERE
	bookings.c_id = clients.c_id AND
	bookings.v_id = vehicles.v_id AND
	bookings.bid_status = 'open'";	

$r=mysqli_query($connect,$sql);

$output=mysqli_fetch_all($r,MYSQLI_ASSOC);
	
	

if(count($output)>0){    				    		

	echo json_encode(array('data'=>$output, 'status'=>true));
	
}else{    

	echo json_encode(array('message'=>'Bid Rides Does Not Exist','status'=>false));
	
}

?>