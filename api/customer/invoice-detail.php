<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$invoice_id=$_POST['invoice_id'];

if(isset($_POST['invoice_id'])){		
	$sql=" SELECT invoice.*, jobs.*, bookings.*, drivers.* FROM invoice, jobs, drivers, bookings, clients WHERE invoice.job_id = jobs.job_id AND jobs.book_id = bookings.book_id AND invoice.d_id = drivers.d_id AND jobs.c_id = clients.c_id AND invoice.invoice_id = '$invoice_id' ";	
	$r=mysqli_query($connect,$sql);
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);
	if(count($output)>0){    				    		
		echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Invoice Details Fetch Successfully"));
	}else{    
		echo json_encode(array('message'=>'No Invoice Found!','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>