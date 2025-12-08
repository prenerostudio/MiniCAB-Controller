<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

$d_id=$_POST['d_id'];

if(isset($_POST['d_id'])){		
    $sql="SELECT invoice.*, jobs.*, bookings.*, drivers.*, clients.* FROM invoice INNER JOIN jobs ON invoice.job_id = jobs.job_id INNER JOIN drivers ON invoice.d_id = drivers.d_id INNER JOIN bookings ON jobs.book_id = bookings.book_id INNER JOIN clients ON invoice.c_id = clients.c_id WHERE invoice.d_id = '$d_id' ORDER BY invoice.invoice_id DESC";
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