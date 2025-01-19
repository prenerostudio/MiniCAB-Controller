<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];
$status = 'Way to Pickup';
if(isset($_POST['d_id'])){ 
    $sql="UPDATE `drivers` SET `status`='$status' WHERE `d_id`='$d_id'";
    $r=mysqli_query($connect,$sql);
    if($r){ 
        $activity_type = "Status Updated to $status";
        $user_type = 'driver';
        $details = "Your Status recently Updated";
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
        echo json_encode(array('message'=>"Driver is on the way to Pickup Point",'status'=>true));	
        }else{    	
            echo json_encode(array('message'=>"Error In fetching status",'status'=>false));	
            }           
        }else{	
            echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));            
        }
?>