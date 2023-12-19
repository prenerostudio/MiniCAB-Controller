<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$job_id = $_POST['job_id'];
$d_id = $_POST['d_id'];
$p_method = 'Cash';

$journey_fare = $_POST['journey_fare'];
$extra = $_POST['extra'];
$parking = $_POST['parking'];
$tolls = $_POST['tolls'];
$status = 'unpaid';
$date = date("Y-m-d h:i:s");

if(isset($_POST['job_id'])){ 
	
	
	$total_pay = $journey_fare + $parking + $extra + $tolls;
	
	        		
		$sql="INSERT INTO `invoice`(
									`job_id`, 
									`d_id`,  
									`p_method`, 
									`journey_fare`, 
									`extra_waiting`, 
									`parking`, 
									`tolls`, 
									`total_pay`, 
									`status`, 
									`invoice_date`
									) VALUES (
									'$job_id',
									'$d_id',									
									'$p_method',
									'$journey_fare',
									'$extra',
									'$parking',
									'$tolls',
									'$total_pay',
									'$status',
									'$date')";				
		
		$r=mysqli_query($connect,$sql);
		if($r){    
			$job_status = 'Completed';
			$usql="UPDATE `jobs` SET 
									`job_status`='$job_status',
									`date_job_add`='$date' WHERE `job_id`='$job_id'";
			$ur=mysqli_query($connect,$usql);
			
			
			
			echo json_encode(array('message'=>"Invoice Generated Successfully",'status'=>true));
		}else{    
			echo json_encode(array('message'=>"Error In Generating Invoice",'status'=>false));
		}
	       
}else{
   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>