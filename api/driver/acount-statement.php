<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id=$_POST['d_id'];

if(isset($_POST['d_id'])){		

    $sql="SELECT invoice.*, jobs.book_id, drivers.*, bookings.*, booking_type.*, clients.* FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN clients ON jobs.c_id = clients.c_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE invoice.d_id = '$d_id' ORDER BY invoice.invoice_id DESC";		

    $r=mysqli_query($connect,$sql);

    $output=mysqli_fetch_all($r,MYSQLI_ASSOC);

    if(count($output)>0){    				    		

        echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Job List Fetch Successfully"));
	
        
    }else{    
	
        echo json_encode(array('message'=>'No Invoice is Available','status'=>false));
	}
}else{    
	
    echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>