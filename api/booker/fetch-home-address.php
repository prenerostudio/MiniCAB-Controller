<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$c_id = $_POST['c_id'];


if (isset($_POST['c_id'])) {	
	$sql="SELECT * FROM `customers_address` WHERE `c_id`='$c_id'";								

	$r=mysqli_query($connect,$sql);
	if($r){    
		$output=mysqli_fetch_all($r,MYSQLI_ASSOC);	
		echo json_encode(array('data'=>$output, 'message'=>'Addresses in Successfully','status'=>true));	
	}else{    		
		echo json_encode(array('message'=>"Error In Fetching Home Address",'status'=>false));			
	}		
} else {
	echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>