<?php
include('../../configuration.php');
include('../../session.php');
	
$from = $_GET['from'];
$to = $_GET['to'];
$sql = "DELETE FROM `vehicle_pricing_miles` WHERE `from_miles`='$from' AND `to_miles`='$to'";
$result = $connect->query($sql);

if($result){ 	

    $activity_type = 'Price by Mile Deleted';	

    $user_type = 'user';	

    $details = "Price by Mile Has Been Deleted by Controller.";
	

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