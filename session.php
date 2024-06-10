<?php
session_start(); 
ini_set("display_errors","off");

$myId = $_SESSION['user_id'];
$email = $_SESSION['email'];                		
$fname=	$_SESSION['first_name'];                		
$lname= $_SESSION['last_name'];               		
$userphone = $_SESSION['user_phone'];                            			                		
$user_pic = $_SESSION['user_pic'];		
$designation = $_SESSION['designation'];

if (!isset($_SESSION['email'])) {	
	$_SESSION['first_name'] = $fname;	
	$_SESSION['last_name'] = $lname;	
	$_SESSION['msg'] = "You must log in first";	
	header('location: index.php');
}
?>