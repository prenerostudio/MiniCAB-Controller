<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

$d_id=$_POST['d_id'];
if(isset($_POST['d_id'])){			
    $sql="SELECT  reviews.*, bookings.pickup, bookings.destination, bookings.journey_type, bookings.pick_date, bookings.pick_time, drivers.d_name, clients.c_name FROM jobs INNER JOIN reviews ON reviews.job_id = jobs.job_id INNER JOIN bookings ON jobs.book_id = bookings.book_id INNER JOIN clients ON reviews.c_id = clients.c_id INNER JOIN drivers ON reviews.d_id = drivers.d_id WHERE reviews.d_id = '$d_id' ORDER BY reviews.rev_id DESC";
    $r=mysqli_query($connect,$sql);
    $output=mysqli_fetch_all($r,MYSQLI_ASSOC);
    if(count($output)>0){    				    		
        echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Reviews List Fetch Successfully"));	        
    }else{    	
        echo json_encode(array('message'=>'No Review Found','status'=>false));	      
    }
}else{	
    echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>