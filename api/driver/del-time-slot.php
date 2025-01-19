<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$at_id = $_POST['at_id'];

if(isset($_POST['at_id'])){	

    $sql="DELETE FROM `availability_times` WHERE `at_id`='$at_id'";

    $r=mysqli_query($connect,$sql);

    if($r){    

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
		
		
	
        echo json_encode(array('message'=>'Slot Has Been Deleted','status'=>true));
	
        
    }else{    
	
        
        echo json_encode(array('message'=>'No Record Found','status'=>false));
	}
}else{
	
    echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>