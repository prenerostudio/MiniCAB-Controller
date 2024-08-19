<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id=$_POST['c_id'];

if(isset($_POST['c_id'])){		
	$sql="SELECT invoice.*, jobs.*, bookings.*, drivers.* FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN clients ON jobs.c_id = clients.c_id WHERE invoice.c_id = '$c_id' ORDER BY invoice.invoice_id DESC";	
	$r=mysqli_query($connect,$sql);
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);
	if(count($output)>0){    				    		
		echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Invoice List Fetch Successfully"));
	}else{    
		echo json_encode(array('message'=>'No Invoice Found!','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>