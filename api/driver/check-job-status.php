<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$job_id=$_POST['job_id'];
$d_id = $_POST['d_id'];

if(isset($_POST['job_id'])){		

	$sql="SELECT jobs.*, bookings.*, clients.*, drivers.*, booking_type.* FROM jobs JOIN bookings ON jobs.book_id = bookings.book_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN clients ON jobs.c_id = clients.c_id JOIN drivers ON jobs.d_id = drivers.d_id WHERE jobs.job_id = '$job_id' AND
    jobs.d_id = $d_id";
	
	$r=mysqli_query($connect,$sql);
	
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);
	
	if(count($output)>0){    				    		
	
		echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Booking Fetch Successfully"));
	}else{    
		echo json_encode(array('message'=>'Booking has been recovered from you by controller','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>