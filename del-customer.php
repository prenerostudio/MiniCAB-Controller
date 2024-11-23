<?php
include('config.php');
include('session.php');
	
$c_id = $_GET['c_id'];
$sql = "DELETE FROM `clients` WHERE `c_id`='$c_id'";
$result = $connect->query($sql);

if($result){ 	

    $activity_type = 'Customer Profile Deleted';	

    $user_type = 'user';	

    $details = "Customer Profile Has Been Deleted by Controller.";
	

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