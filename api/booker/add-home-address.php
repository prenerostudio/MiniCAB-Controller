<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$c_id = $_POST['c_id'];
$address = $_POST['address'];
$date = date("Y-m-d h:i:s");

if (isset($_POST['c_id'])) {	
	$sql="INSERT INTO `customers_address`(
									`c_id`, 
									`address`, 
									`date_add_added`
									) VALUES (
									'$c_id',
									'$address',
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