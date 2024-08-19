<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id = $_POST['c_id'];
$job_id = $_POST['job_id'];
$d_id = $_POST['d_id'];
$rev_msg = $_POST['rev_msg'];
$date = date("Y-m-d h:i:s");

if(isset($_POST['c_id'])){ 	 	
	        		
		$sql="INSERT INTO `reviews`(
									`job_id`, 
									`d_id`, 
									`c_id`, 
									`rev_msg`
									) VALUES (
									'$job_id',
									'$d_id',
									'$c_id',
									'$rev_msg')";				
		
		$r=mysqli_query($connect,$sql);
		if($r){  
			$activity_type = 'Review Posted by Customer';				
			$user_type = 'client';				
			$details = "Customer Has posted reviews on job ID: $job_id.";				
			$actsql = "INSERT INTO `activity_log`(
										`activity_type`, 
										`user_type`, 
										`user_id`, 
										`details`
										) VALUES (
										'$activity_type',
										'$user_type',
										'$c_id',
										'$details')";
			$actr = mysqli_query($connect, $actsql);
			echo json_encode(array('message'=>"Review Posted Successfully",'status'=>true));
		}else{    
			echo json_encode(array('message'=>"Error In Posting Review",'status'=>false));
		}
	       
}else{
   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>