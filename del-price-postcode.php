<?php
include('config.php');
include('session.php');
	
$pp_id = $_GET['pp_id'];
$sql = "DELETE FROM `price_postcode` WHERE `pp_id`='$pp_id'";
$result = $connect->query($sql);

if($result){ 	

    $activity_type = 'Price by Post Code Deleted';	

    $user_type = 'user';	

    $details = "Price by Post Code Has Been Deleted by Controller.";
	

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

    header('location: pricing.php');
} else {

    header('location: pricing.php');
}
?>