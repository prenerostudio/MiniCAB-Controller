<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$job_id = $_POST['job_id'];

if(isset($_POST['job_id'])){		
	
	 $sql="SELECT jobs.*, bookings.*, clients.*, drivers.* FROM jobs, clients, drivers, bookings WHERE jobs.book_id = bookings.book_id AND jobs.c_id = clients.c_id AND jobs.d_id = drivers.d_id AND jobs.job_id = '$job_id'";	

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