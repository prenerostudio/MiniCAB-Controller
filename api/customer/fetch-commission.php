<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id = $_POST['c_id'];

$sql="SELECT `commission_type`, `percentage`, `fixed` FROM `clients` WHERE `c_id`='$c_id'";		
$r=mysqli_query($connect,$sql);
$output=mysqli_fetch_all($r,MYSQLI_ASSOC);		
if(count($output)>0){    				    		
	echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Commission Fetch Successfully"));
}else{    
	echo json_encode(array('message'=>'No Commission Found','status'=>false));
}
?>