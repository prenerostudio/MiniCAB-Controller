<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$book_id = $_POST['book_id'];
if(isset($_POST['book_id'])){		
	
	
    $sql="SELECT bookings.*, clients.*, booking_type.*, vehicles.* FROM bookings JOIN clients ON bookings.c_id = clients.c_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE bookings.book_id = '$book_id'";
	
    $r=mysqli_query($connect,$sql);	

    $output=mysqli_fetch_all($r,MYSQLI_ASSOC);		

    if(count($output)>0){    				    		

        echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Booking List Fetch Successfully"));
	
        
    }else{    
	
        echo json_encode(array('message'=>'No Booking Found','status'=>false));
	
        
    }
}else{    
	
    echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>