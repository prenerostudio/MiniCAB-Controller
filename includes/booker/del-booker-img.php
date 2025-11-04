<?php
include('../../config.php');
include('../../session.php');

$c_id = $_GET['c_id'];	
$sql = "UPDATE `clients` SET  `c_pic`=''  WHERE `c_id`='$c_id'";	
$result = $connect->query($sql);	
if($result){ 	
    $activity_type = 'Booker Image Deleted';	
    $user_type = 'user';	
    $details = "Booker Image Has Been Deleted by Controller.";	
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
    header('location: ../../view-booker.php?c_id='.$c_id);	
} else {				 
    header('location: ../../view-booker.php?c_id='.$c_id);	
}
?>