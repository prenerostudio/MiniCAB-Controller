<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

$d_id=$_POST['d_id'];

if(isset($_POST['d_id'])){		
	$sql=" SELECT j.*, c.c_name, c.c_email, c.c_phone, c.c_address, d.d_name, d.d_email, d.d_phone, b.* FROM jobs AS j INNER JOIN drivers AS d ON j.d_id = d.d_id INNER JOIN clients AS c ON j.c_id = c.c_id INNER JOIN bookings AS b ON j.book_id = b.book_id WHERE j.d_id = '$d_id' AND j.job_status IN ('Completed', 'Cancelled') ORDER BY j.job_id DESC";	
	$r=mysqli_query($connect,$sql);
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);
	if(count($output)>0){    				    		
		echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Job History Fetch Successfully"));
	}else{    
		echo json_encode(array('message'=>'NO Job Found in History','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>