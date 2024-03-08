<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];
if (isset($_POST['d_id'])) {	
	$sql="SELECT * FROM `vehicle_documents` WHERE `d_id`='$d_id'";									
	$r=mysqli_query($connect,$sql);	
	if($r){    	
		$output=mysqli_fetch_all($r,MYSQLI_ASSOC);			
		echo json_encode(array('data'=>$output, 'message'=>'Vehicle Document Fetched Successfully','status'=>true));		
	}else{    			
		echo json_encode(array('message'=>"Error In Fetching Vehicle Documents",'status'=>false));				
	}		
} else {	
	echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>