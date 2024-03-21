<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$at_id = $_POST['at_id'];

if(isset($_POST['at_id'])){	
	$sql="DELETE FROM `availability_times` WHERE `at_id`='$at_id'";
	$r=mysqli_query($connect,$sql);
	if($r){    
		//$output=mysqli_fetch_all($r,MYSQLI_ASSOC);    
		echo json_encode(array('message'=>'Slot Has Been Deleted','status'=>true));
	}else{    
		echo json_encode(array('message'=>'No Record Found','status'=>false));
	}
}else{
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>