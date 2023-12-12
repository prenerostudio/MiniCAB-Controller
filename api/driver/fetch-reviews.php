<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id=$_POST['d_id'];

if(isset($_POST['d_id'])){		
	
	 $sql=" SELECT
	reviews.*, 
	bookings.pickup, 
	bookings.destination, 
	bookings.journey_type, 
	bookings.book_time, 
	bookings.book_date, 
	drivers.d_name, 
	clients.c_name
FROM
	jobs,
	reviews,
	bookings,
	clients,
	drivers
WHERE
	reviews.job_id = jobs.job_id AND
	jobs.book_id = bookings.book_id AND
	reviews.d_id = drivers.d_id AND
	reviews.c_id = clients.c_id AND
	reviews.d_id = '$d_id'";	
	$r=mysqli_query($connect,$sql);
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);
	
	
	if(count($output)>0){    				    		
		echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Reviews List Fetch Successfully"));
	}else{    
		echo json_encode(array('message'=>'User Does Not Exist','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>