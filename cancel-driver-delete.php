<?php
include('config.php');
include('session.php');
	

$del_d_id = $_GET['del_d_id'];

$status = 2;


$sql = "UPDATE `delete_drivers` SET `req_status`='$status' WHERE `del_d_id`='$del_d_id'";

$result = $connect->query($sql);


if($result){ 	

    $activity_type = 'Driver Acount Deletion Request Cancelled';	

    $user_type = 'user';	

    $details = "Driver Acount Deletion Request has been Cancelled.";

    

    $actsql = "INSERT INTO `activity_log`(
					`activity_type`, 
					`user_type`, 
					`user_id`, 
					`details`
					) VALUES (
					'$activity_type',
					'$user_type',
					'$myId',
					'$details')";
	

    $actr = mysqli_query($connect, $actsql);

    header('location: driver-delete-request.php');

    
} else {

    header('location: driver-delete-request.php');

    
}
?>