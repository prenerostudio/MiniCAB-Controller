<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$at_id = $_POST['at_id'];
$d_id = $_POST['d_id'];
$status = 0;


if(isset($_POST['d_id'])){ 					
		$sql="UPDATE `availability_times` SET `d_id`='$d_id', `at_status`='$status' WHERE `at_id`='$at_id'";								
		$r=mysqli_query($connect,$sql);		
		if($r){    			
			echo json_encode(array('message'=>"Time Slot Rejected Successfully",'status'=>true));		
		}else{    		
			echo json_encode(array('message'=>"Error In Adding Time Slot",'status'=>false));		
		}				
		
}else{   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>