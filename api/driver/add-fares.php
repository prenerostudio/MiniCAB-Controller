<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$job_id = $_POST['job_id'];
$d_id = $_POST['d_id'];
$journey_fare = $_POST['journey_fare'];
$car_parking = $_POST['car_parking'];
$extra = $_POST['extra'];
$tolls = $_POST['tolls'];
$waiting = $_POST['waiting'];
$fare_status = 'Pending';
$date = date("Y-m-d h:i:s");

if(isset($_POST['job_id'])){ 
	$chksql = "SELECT * FROM `fares` WHERE `job_id`='$job_id'";	
	$chkr=mysqli_query($connect,$chksql);		
	if($chkr && mysqli_num_rows($chkr) > 0) {			
		echo json_encode(array('message'=>"Fares Already Submitted!",'status'=>false));		
	}else{					
		$sql="INSERT INTO `fares`(
									`job_id`,
									`d_id`, 
									`journey_fare`, 
									`car_parking`, 
									`waiting`, 
									`tolls`, 
									`extras`, 
									`fare_status`, 
									`apply_date`
									) VALUES (
									'$job_id',
									'$d_id',
									'$journey_fare',
									'$car_parking',
									'$waiting',
									'$tolls',
									'$extra',
									'$fare_status',
									'$date')";								
		$r=mysqli_query($connect,$sql);		
		if($r){   
			$activity_type = 'Journey Fare Added';
			$user_type = 'driver';
			$details = "Journey Fare added for correction against job #: $job_id.";
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
			echo json_encode(array('message'=>"Fare Details Submitted Successfully",'status'=>true));		
		}else{    		
			echo json_encode(array('message'=>"Error In Submitting Fare Details",'status'=>false));		
		}				
	}	
}else{   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>