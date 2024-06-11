<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id = $_POST['c_id'];
$job_id = $_POST['job_id'];
$rating = $_POST['rating'];
$date = date("Y-m-d h:i:s");

if(isset($_POST['c_id'])){	        		
		$sql="INSERT INTO `reviews`(
									`job_id`, 
									`c_id`, 
									`ratings`
									) VALUES (
									'$job_id',
									'$c_id',
									'$rating')";				
		
		$r=mysqli_query($connect,$sql);
		if($r){			
			$activity_type = 'Rating Posted by Customer';				
			$user_type = 'client';				
			$details = "Customer Has posted rating on job ID: $job_id.";				
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
			echo json_encode(array('message'=>"Rating Posted Successfully",'status'=>true));
		}else{    
			echo json_encode(array('message'=>"Error In Posting Rating",'status'=>false));
		}
	       
}else{
   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>