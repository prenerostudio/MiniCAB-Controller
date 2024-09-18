<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id=$_POST['c_id'];

if(isset($_POST['c_id'])){				 
	$sql="SELECT bookings.*, clients.*, vehicles.*, booking_type.* FROM bookings INNER JOIN clients ON bookings.c_id = clients.c_id INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id INNER JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE bookings.c_id = '$c_id' AND bookings.booking_status = 'Pending' ORDER BY bookings.book_add_date DESC";	
	$r=mysqli_query($connect,$sql);
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);		
	if(count($output)>0){    				    		
		echo json_encode(array('data'=>$output, 'status'=>true,));
	}else{    
		echo json_encode(array('message'=>'User Does Not Exist','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>