<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];
$c_id = $_POST['c_id'];
$job_id = $_POST['job_id'];
$rev_msg = $_POST['rev_msg'];
$date = date("Y-m-d h:i:s");

if(isset($_POST['c_id'])){ 	 		        		
	$sql="INSERT INTO `reviews`(	
								`job_id`, 								
								`d_id`, 								
								`c_id`, 								
								`rev_msg`, 								
								`rev_date`								
								) VALUES (								
								'$job_id',								
								'$d_id',								
								'$c_id',								
								'$rev_msg',								
								'$date')";									
	$r=mysqli_query($connect,$sql);	
	if($r){    	
		echo json_encode(array('message'=>"Review Posted Successfully",'status'=>true));		
	}else{    	
		echo json_encode(array('message'=>"Error In Posting Review",'status'=>false));		
	}	       
}else{   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>