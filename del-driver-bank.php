<?php
include('config.php');
include('session.php');

$d_bank_id = $_GET['d_bank_id'];
$d_id = $_GET['d_id'];
$sql = "DELETE FROM `driver_bank_details` WHERE `d_bank_id`='$d_bank_id'";
$result = $connect->query($sql);
if($result){ 	
    $activity_type = 'Driver Bank Account Deleted';	
    $user_type = 'user';	
    $details = "Driver Bank Has Been Deleted by Controller.";
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
    header('Location: view-driver.php?d_id='.$d_id.'#tabs-bank');   	
} else {		
    header('Location: view-driver.php?d_id='.$d_id.'#tabs-bank');   	
}
?>