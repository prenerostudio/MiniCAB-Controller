<?php
include('config.php');
include('session.php');
	
$com_id = $_GET['com_id'];
$sql = "UPDATE `companies` SET `com_pic`='' WHERE `com_id`='$com_id'";
$result = $connect->query($sql);
	
if($result){ 		

    $activity_type = 'Company Image Deleted';	

    $user_type = 'user';	

    $details = "Company Image Has Been Deleted by Controller.";
	

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

    header('location: view-company.php?com_id='.$com_id);	
} else {

    echo "<script>alert('Some error occurred. Try again')</script>";	

    header('location: view-company.php?com_id='.$com_id);	
}
?>