<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id=$_POST['c_id'];

if(isset($_POST['c_id'])){				
	$sql="SELECT jobs.*, bookings.*, clients.*, drivers.*, vehicles.* FROM jobs JOIN bookings ON jobs.book_id = bookings.book_id JOIN clients ON jobs.c_id = clients.c_id JOIN drivers ON jobs.d_id = drivers.d_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE jobs.c_id = '$c_id' AND jobs.job_status = 'completed' ORDER BY jobs.date_job_add DESC";	
	$r=mysqli_query($connect,$sql);
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);		
	if(count($output)>0){    				    		
		echo json_encode(array('data'=>$output, 'status'=>true,));
	}else{    
		echo json_encode(array('message'=>'No Booking Found','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>