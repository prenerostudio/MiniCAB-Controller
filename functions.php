<?php
include('config.php');
session_start();

if (isset($_POST['login_user'])) {		
	$email =  $_POST['email'];		
	$password = $_POST['password'];	
	$fpassword = md5($password);		
	
	$query = "SELECT * FROM `users` WHERE `user_email`='$email' AND `user_password`='$fpassword'";						
	$results = mysqli_query($connect, $query);		
	
	if (mysqli_num_rows($results) == 1) {				
		$crow = mysqli_fetch_array($results);            				
		$_SESSION['email'] = $email;                		
		$_SESSION['first_name'] = $crow['first_name'];                		
		$_SESSION['last_name'] = $crow['last_name'];               		
		$_SESSION['user_phone'] = $crow['user_phone'];                            			                		
		$_SESSION['user_id'] = $crow['user_id'];		
		$_SESSION['user_pic'] = $crow['user_pic'];		
		$_SESSION['designation'] = $crow['designation'];		
		$_SESSION['success'] = "You are now logged in";						
		$_SESSION['full_name']= $crow['first_name'] ." " .$crow['last_name'];								
		header('location: dashboard.php');					
	}else {				
		//array_push($errors, "Wrong username/password combination");				
		header('location: index.php');						
	}		
}
?>