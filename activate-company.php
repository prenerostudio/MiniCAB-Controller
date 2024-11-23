<?php
include('config.php');
include('session.php');
$com_id = $_GET['com_id'];
$status = 1;
$sql = "UPDATE `companies` SET `acount_status`='$status' WHERE `com_id`='$com_id'";
$result = $connect->query($sql);
if($result){
    $activity_type = 'Activate Company';        		
    $user_type = 'user';        		
    $details = "Company ID: " . $com_id . " Has Been Activated";
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
    header('location: blocked-companies.php');	
}
?>