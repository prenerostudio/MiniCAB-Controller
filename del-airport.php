<?php
include('config.php');
include('session.php');

$ap_id = $_GET['ap_id'];
$sql = "DELETE FROM `airports` WHERE `ap_id`='$ap_id'";
$result = $connect->query($sql);
if($result){ 	

    $activity_type = 'Airport Deleted';	

    $user_type = 'user';	

    $details = "Airport Has Been Deleted by Controller.";
	

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

    header('location: airports.php');	
} else {

    header('location: airports.php');	
}
?>