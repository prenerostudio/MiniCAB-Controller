<?php
include('../../config.php');
include('../../session.php');

$user_id = $_GET['user_id'];
$sql = "DELETE FROM `users` WHERE `user_id` = '$user_id'";
$result = $connect->query($sql);
if($result){
    $activity_type = 'Controller Deleted';	
    $user_type = 'user';	
    $details = "Controller Has Been Deleted by Super Admin.";	
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
    header('location: ../../all-users.php');	
} else {
    header('location: ../../all-users.php');	
}
?>