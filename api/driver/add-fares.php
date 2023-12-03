<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$job_id = $_POST['job_id'];
$d_id = $_POST['d_id'];
$fare = $_POST['fare'];
$parking = $_POST['parking'];
$extra = $_POST['extra'];
$tolls = $_POST['tolls'];
$fare_status = 'Pending';
$date = date("Y-m-d h:i:s");

if(isset($_POST['job_id'])){ 
	      		
		$sql="INSERT INTO `fares`( 
								`job_id`, 
								`d_id`, 
								`journey_fare`, 
								`extra_waiting`, 
								`parking`, 
								`tolls`, 
								`fare_status`, 
								`apply_date`
								) VALUES ( 
								'$job_id',
								'$d_id',
								'$fare',
								'$extra',
								'$parking',
								'$tolls',
								'$fare_status',
								'$date')";				
		
		$r=mysqli_query($connect,$sql);
		if($r){    	
			echo json_encode(array('message'=>"Fare Details Submitted Successfully",'status'=>true));
		}else{    
			echo json_encode(array('message'=>"Error In Submitting Fare Details",'status'=>false));
		}
	       
}else{
   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>