<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");
// Assuming you have user authentication and receiver ID is received from the form   
$d_id = $_POST['d_id']; // Replace with actual sender's user ID   
$admin_id = 1;    
$message = $_POST['message'];
$date = date("Y-m-d h:i:s");

if(isset($_POST['d_id'])){ 					

    $sql="INSERT INTO `messages`( `sender_id`, `receiver_id`, `message`, `sent_at`) VALUES ('$d_id','$admin_id','$message','$date')";	

    $r=mysqli_query($connect,$sql);			

    if($r){    				

        echo json_encode(array('message'=>"Message Sent Successfully",'status'=>true));				
	
        
    }else{    			
	
        echo json_encode(array('message'=>"Error In Sending Message",'status'=>false));				
	
        
    }						
}else{   
	
    echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>