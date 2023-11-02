<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$job_id = $_POST['job_id'];
$d_id = $_POST['d_id'];
$p_method = $_POST['p_method'];
$fare = $_POST['fare'];
$parking = $_POST['parking'];
$extra = $_POST['extra'];
$waiting = $_POST['waiting'];
$status = 'unpaid';
$date = date("Y-m-d h:i:s");

if(isset($_POST['job_id'])){ 
	
	
	$total_pay = $fare + $parking + $extra + $waiting;
	
	        		
		$sql="INSERT INTO `invoice`(
									`job_id`, 
									`d_id`, 
									`p_method`, 
									`parking_charges`, 
									`extra_drop_charges`, 
									`driver_waiting`, 
									`fare`, 
									`total_pay`, 
									`status`, 
									`invoice_date`
									) VALUES (
									'$job_id',
									'$d_id',
									'$p_method',
									'$parking',
									'$extra',
									'$waiting',
									'$fare',
									'$total_pay',
									'$status',
									'$date')";				
		
		$r=mysqli_query($connect,$sql);
		if($r){    
			echo json_encode(array('message'=>"Invoice Generated Successfully",'status'=>true));
		}else{    
			echo json_encode(array('message'=>"Error In Generating Invoice",'status'=>false));
		}
	       
}else{
   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>