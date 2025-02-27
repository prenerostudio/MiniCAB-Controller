<?php
require 'config.php';
include('session.php');

$zn = $_POST['zn'];
$lat_min = $_POST['lat_min'];
$lat_max = $_POST['lat_max'];
$lng_min = $_POST['lng_min'];
$lng_max = $_POST['lng_max'];

$sql = "INSERT INTO `zones`(`zone_name`, `lat_min`, `lat_max`, `lng_min`, `lng_max`) VALUES ('$zn','$lat_min','$lat_max','$lng_min','$lng_max')";                
$result = mysqli_query($connect, $sql);       
if ($result) {	
    $activity_type = 'New Zone Added';
    $user_type = 'user';
    $details = "New Zone " . $zn . " Has Been Added by Controller " . $fname . ".";
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
    header('Location: zones.php');
    exit();    
} else {
    header('Location: zones.php');    
}
$connect->close();
?>