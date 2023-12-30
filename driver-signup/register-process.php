<?php
session_start();
include('config.php');

$d_name = $_POST['d_name'];
$d_phone  = $_POST['d_phone'];
$d_email	= $_POST['d_email'];
$d_post = $_POST['post_code'];
$status  = 0;
$date = date("Y-m-d H:i:s");

$checksql = "SELECT * FROM `drivers` WHERE `d_phone`='$d_phone'";
$checkr = mysqli_query($connect, $checksql);
$datacheck = mysqli_fetch_all($checkr, MYSQLI_ASSOC);

if (count($datacheck) > 0) {
	$_SESSION['success_msg'] = "Your Account already exist ith this number. Try another or login via Mobile App.";    
} else {
	$sql = "INSERT INTO `drivers`( 	
	`d_name`, 	
	`d_email`, 	
	`d_phone`, 	
	`d_post_code`, 	
	`acount_status`, 	
	`driver_reg_date`	
	) VALUES (	
	'$d_name',	
	'$d_email',	
	'$d_phone',	
	'$d_post',	
	'$status',	
	'$date')";    
	    
	$r = mysqli_query($connect, $sql);	    	
	if ($r) {  	
		$_SESSION['success_msg'] = "Thanks for Acount Registration with MiniCAB Services! We will get back to you via SMS/Email.";		
		header('Location: success-message.php');    	
		exit();    
	} else {		
		header('Location: index.php'); 	
		$_SESSION['success_msg'] = "Error in Acount Registration. Try Again Later!";
	}
}             
$connect->close();
?>
