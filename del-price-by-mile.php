<?php
include('config.php');
include('session.php');
	
$pm_id = $_GET['pm_id'];
$sql = "DELETE FROM `price_mile` WHERE `pm_id`='$pm_id'";
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