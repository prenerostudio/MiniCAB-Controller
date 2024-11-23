<?php
include('config.php');
include('session.php');
	
$ph_id = $_GET['ph_id'];
$sql = "DELETE FROM `peak_hours` WHERE `ph_id`='$ph_id'";
$result = $connect->query($sql);


if($result){ 	

    $activity_type = 'Peak Hours Deleted Deleted';	

    $user_type = 'user';	

    $details = "Peak Hours Deleted Has Been Deleted by Controller.";
	

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