<?php
include('config.php');
include('session.php');
	
$com_id = $_GET['com_id'];
$sql = "DELETE FROM `companies` WHERE `com_id`='$com_id'";
$result = $connect->query($sql);

if($result){ 	

    $activity_type = 'Company Profile Deleted';	

    $user_type = 'user';	

    $details = "Company Profile Has Been Deleted by Controller.";
	

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

    header('location: companies.php');
} else {

    header('location: companies.php');
}
?>