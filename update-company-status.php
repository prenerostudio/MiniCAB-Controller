<?php
include('config.php');
include('session.php');

$c_id = $_GET['id'];
$status = 1;
$sql = "UPDATE `clients` SET  `acount_status`='$status',`reg_date`='$date' WHERE `c_id`='$c_id'";
$result = $connect->query($sql);
if($result){ 	
    $activity_type = 'Customer Verified';	
    $user_type = 'user';	
    $details = "Customer " . $c_id . " Has Been Verified by Controller.";
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
    header('location: customers.php');	
} else {	
    header('location: customers.php');	
}
?>