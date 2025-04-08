<?php
include('config.php');
include('session.php');

$st = $_POST['st'];
$et = $_POST['et'];
$days = implode(" , ", $_POST['days']);
$price = $_POST['price'];
$sql="INSERT INTO `peak_hours`(
			`start_time`, 
			`end_time`, 
			`peak_hours_days`, 
			`price_increment`
			) VALUES (
			'$st',
			'$et',
			'$days',
			'$price')";
$result = $connect->query($sql);
if($result){	
    $activity_type = 'Peak Hours Charges Added';    	
    $user = 'Controller';    	
    $details = 'New Peak Hours Charges have been added by Controller.';                	
    $actsql = "INSERT INTO `activity_log` (`activity_type`, `user`, `details`) VALUES ($activity_type, $user, $details)";    	
    $actstmt = $connect->query($actsql);				
    header('location: pricing.php');
}else{
    echo 'error';
}
?>