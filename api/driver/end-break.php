<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$bt_id = $_POST['bt_id'];
$d_id = $_POST['d_id'];
$date = date("Y-m-d h:i:s");
$total_time = $_POST['total_time'];
$status = 1;

if(isset($_POST['bt_id'])){ 	
	$sql="UPDATE `break_time` SET `end_time`='$date',`total_time`='$total_time',`break_status`='$status' WHERE `bt_id`='$bt_id'";	
	$r=mysqli_query($connect,$sql);
	
	if($r){   	
		$dsql="UPDATE `drivers` SET  `status`='online' WHERE `d_id`='$d_id'";		
		$dr=mysqli_query($connect,$dsql);
				
		$activity_type = 'Break Time Ends';        			
		$user_type = 'driver';
		$details = "Break Time Ends and back to online";
		
		$actsql = "INSERT INTO `activity_log`(
												`activity_type`, 
												`user_type`, 
												`user_id`, 
												`details`
												) VALUES (
												'$activity_type',
												'$user_type',
												'$d_id',
												'$details')";		
					
		$actr = mysqli_query($connect, $actsql);	
											
		echo json_encode(array('message'=>"Driver is Back to Online",'status'=>true));		
	}else{    	
		echo json_encode(array('message'=>"Error In fetching status",'status'=>false));		
	}	       
}else{   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>