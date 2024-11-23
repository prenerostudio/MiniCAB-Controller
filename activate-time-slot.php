<?php
include('config.php');
include('session.php');
$ts_id = $_GET['ts_id'];
$d_id = 0;
$status = 3;
$sql = "UPDATE `time_slots` SET `d_id`='$d_id', `ts_status`='$status' WHERE `ts_id`='$ts_id'";
$result = $connect->query($sql);
if($result){
    $activity_type = 'Time Slot Withdrawn';	
    $user_type = 'user';	
    $details = "Time Slot Has Been Withdrawn by Controller.";    
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
    header('location: available-time-slots.php');
} else {
    header('location: available-time-slots.php');
}
?>