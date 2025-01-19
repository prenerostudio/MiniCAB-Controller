<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];
$bank_name = $_POST['bank_name'];
$account_number = $_POST['account_number'];
$sort_code = $_POST['sort_code'];

if(isset($_POST['d_id'])){ 					

    $sql="INSERT INTO `driver_bank_details`(
					`d_id`, 
					`bank_name`, 
					`account_number`, 
					`sort_code`										
					) VALUES (											
					'$d_id',
					'$bank_name',
					'$account_number',
					'$sort_code')";								

    $r=mysqli_query($connect,$sql);		

    if($r){			

        $activity_type = 'Bank Account Added';
	
        $user_type = 'driver';
	
        $details = "Bank Account Number $account_number has been added.";
	
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
	
        echo json_encode(array('message'=>"Bank Details Added Successfully",'status'=>true));		
	
        }else{    		
	
            echo json_encode(array('message'=>"Error In Adding Bank Details",'status'=>false));		
	
            }
}else{   
	
    echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>