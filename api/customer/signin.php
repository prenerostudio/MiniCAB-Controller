<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_phone = $_POST['c_phone'];
$c_password=$_POST['c_password'];


if(isset($_POST['c_phone'])){	
	//$final_pass= md5($user_password);
	$sql="SELECT * FROM `clients` WHERE `c_phone`='$c_phone' AND `c_password`='$c_password'";
	$r=mysqli_query($connect,$sql);
	if($r){    
		$output=$r->fetch_assoc();   
		echo json_encode(array('data'=>$output, 'message'=>'Customer Logged in Successfully','status'=>true));
	}else{    
		echo json_encode(array('message'=>'Customer Does Not Exist','status'=>false));
	}
}else{
    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));

}


?>
