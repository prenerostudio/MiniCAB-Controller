<?php
require 'config.php'; 
include('session.php');
	
$d_bank_id = $_POST['d_bank_id'];
$d_id = $_POST['d_id'];
$bank_name = $_POST['bank_name'];
$acc_num = $_POST['acc_num'];
$sort_code = $_POST['sort_code'];
         

$sql = "UPDATE `driver_bank_details` SET 
					`d_id`='$d_id',
					`bank_name`='$bank_name',
					`account_number`='$acc_num',
					`sort_code`='$sort_code' WHERE `d_bank_id`='$d_bank_id'";
         

$result = mysqli_query($connect, $sql);              

if ($result) { 	

    $activity_type = 'Driver Bank Details Updated';	

    $user_type = 'user';	

    $details = "Driver  " . $d_name . " Bank Details Has Been Updated by Controller.";
	

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

    exit();       
} else {           			

    header('Location: view-driver.php?d_id='.$d_id.'#tabs-bank');     
}                   
$connect->close();
?>