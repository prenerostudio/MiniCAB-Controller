<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];
$status = 'Waiting for Passenger!';
$date = date("Y-m-d h:i:s");

if(isset($_POST['d_id'])){ 
		$sql="UPDATE `drivers` SET `status`='$status', `driver_reg_date`='$date' WHERE `d_id`='$d_id'";						
		$r=mysqli_query($connect,$sql);
		if($r){    			
			echo json_encode(array('message'=>"Driver is Waiting for Passenger!",'status'=>true));
		}else{    
			echo json_encode(array('message'=>"Error In fetching status",'status'=>false));
		}	       
}else{   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>
