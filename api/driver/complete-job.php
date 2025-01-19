<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$job_id = $_POST['job_id'];
$c_id = $_POST['c_id'];
$d_id = $_POST['d_id'];
$journey_fare = $_POST['journey_fare'];
$car_parking = $_POST['car_parking'];
$waiting = $_POST['waiting'];
$tolls = $_POST['tolls'];
$extra = $_POST['extra'];
$status = 'unpaid';

$job_accepted_time = $_POST['job_accepted_time'];
$job_started_time = $_POST['job_started_time'];
$way_to_pickup_time = $_POST['way_to_pickup_time'];
$arrived_at_pickup_time = $_POST['arrived_at_pickup_time'];
$pob_time = $_POST['pob_time'];
$dropoff_time = $_POST['dropoff_time'];
$job_completed_time = $_POST['job_completed_time'];

$date = date("Y-m-d h:i:s");

if(isset($_POST['job_id'])){ 	
	
    $checksql = "SELECT * FROM `invoice` WHERE `job_id`='$job_id'";

    $chkr=mysqli_query($connect,$checksql);	

    if($chkr && mysqli_num_rows($chkr) > 0){

        echo json_encode(array('message'=>"Invoice Already Created",'status'=>false));		
	
        
    }else{	
	
        $total_pay = $journey_fare + $car_parking + $waiting + $tolls + $extra;	
	
        $driver_commission = $total_pay * 0.20;	   
	
        $sql="INSERT INTO `invoice`( 
				`job_id`, 
				`c_id`, 
				`d_id`,
				`journey_fare`,
				`car_parking`, 
				`waiting`, 
				`tolls`, 
				`extra`, 
				`total_pay`, 
				`driver_commission`, 
				`invoice_status`, 
				`invoice_date`
				) VALUES (
				'$job_id',
				'$c_id',
				'$d_id',
				'$journey_fare',
				'$car_parking',
				'$waiting',
				'$tolls',
				'$extra',
				'$total_pay',
				'$driver_commission',
				'$status',
				'$date')";						
	
        $r=mysqli_query($connect,$sql);
	
        if($r){    
	
            $job_status = 'Completed';
	
            $usql="UPDATE `jobs` SET `job_status`='$job_status', `job_accepted_time`='$job_accepted_time', `job_started_time`='$job_started_time', `way_to_pickup_time`='$way_to_pickup_time', `arrived_at_pickup_time`='$arrived_at_pickup_time', `pob_time`='$pob_time', `dropoff_time`='$dropoff_time', `job_completed_time`='$job_completed_time' WHERE `job_id`='$job_id'";
			
            $ur=mysqli_query($connect,$usql);
			
	
            $activity_type = 'Job Completed';        
	
            $user_type = 'driver';        
	
            $details = "Job # $job_id Has been Completed.";

	
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
	
            echo json_encode(array('message'=>"Invoice Generated Successfully",'status'=>true));
	
            }else{    
	
                echo json_encode(array('message'=>"Error In Generating Invoice",'status'=>false));
		
                
            }
	  }     
}else{
	
    echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>