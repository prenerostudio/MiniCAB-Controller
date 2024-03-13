<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$c_id = $_POST['c_id'];
$account_status = 2;
$message = $_POST['message'];
$date = date("Y-m-d h:i:s");

if (isset($_POST['c_id'])) {	
	$sql="INSERT INTO `delete_customers`(
										`c_id`, 
										`request_msg`, 
										`delete_date`
										) VALUES (
										'$c_id',
										'$message',
										'$date')";								

	$r=mysqli_query($connect,$sql);		
	if($r){    			
		echo json_encode(array('message'=>"Home Address Added Successfully",'status'=>true));			
	}else{    		
		echo json_encode(array('message'=>"Error In adding Home Address",'status'=>false));			
	}		
} else {
	echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>