<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$d_id = $_POST['d_id'];
$day_title = $_POST['day_title'];
$start_time = $_POST['start_time'];
$end_time = $_POST['end_time'];
$date = date("Y-m-d h:i:s");

if(isset($_POST['d_id'])){ 					
		$sql="INSERT INTO `availability_times`(
											`d_id`, 
											`day_title`, 
											`start_time`, 
											`end_time` 											
											) VALUES (
											'$d_id',
											'$day_title',
											'$start_time',
											'$end_time')";								
		$r=mysqli_query($connect,$sql);		
		if($r){    			
			echo json_encode(array('message'=>"Time Slot Added Successfully",'status'=>true));		
		}else{    		
			echo json_encode(array('message'=>"Error In Adding Time Slot",'status'=>false));		
		}				
		
}else{   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>