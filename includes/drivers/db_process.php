<?php
require '../../config.php';
include('../../session.php');

$d_id = $_POST['d_id'];
$bank_name = $_POST['bank_name'];
$acc_num = $_POST['acc_num'];
$sort_code = $_POST['sort_code'];
$date = date("Y-m-d H:i:s");
         
$sql = "INSERT INTO `driver_bank_details`(
					`d_id`, 
					`bank_name`, 
					`account_number`, 
					`sort_code`, 
					`date_added`
					) VALUES (
					'$d_id',
					'$bank_name',
					'$acc_num',
					'$sort_code',
					'$date')";         
$result = mysqli_query($connect, $sql);              
if ($result) {	
    $activity_type = 'Bank Account Added ';	
    $user_type = 'user';	
    $details = "A bank acount to driver ID: " . $d_name . " Has Been Added by Controller.";	
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
    header('Location: ../../view-driver.php?d_id='.$d_id.'#tabs-bank');
    exit();       
} else {           			
    header('Location: ../../view-driver.php?d_id='.$d_id.'#tabs-bank');     
}                   
$connect->close();
?>