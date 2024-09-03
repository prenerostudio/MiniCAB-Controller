<?php
require 'config.php';
include('session.php');

$d_id = $_POST['d_id'];
$dname = $_POST['dname'];
$demail = $_POST['demail'];
$dphone = $_POST['dphone'];
$dgender = $_POST['dgender'];
$daddress = $_POST['daddress'];
$dauth = $_POST['dauth'];
$pc = $_POST['pc'];
$dlang = $_POST['dlang'];
$pco_num  =$_POST['pco_num'];

$sql = "UPDATE `drivers` SET 
							`d_name`='$dname',
							`d_email`='$demail',
							`d_phone`='$dphone',
							`d_address`='$daddress',
							`d_post_code`='$pc',
							`d_gender`='$dgender',
							`d_language`='$dlang',
							`licence_authority`='$dauth',
							`pco_num`='$pco_num' WHERE `d_id`='$d_id'";
        
$result = mysqli_query($connect, $sql);       
if ($result) {		
	$activity_type = 'Driver Profile Updated';	
	$user_type = 'user';	
	$details = "Driver $d_name Profile Has Been updated by Controller.";
	
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
	header('Location: view-driver.php?d_id='.$d_id);    
	exit();    
} else {           
	header('Location: view-driver.php?d_id='.$d_id);    
}
$connect->close();
?>
