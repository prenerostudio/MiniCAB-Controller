<?php
include('config.php');


if (isset($_POST['login_user'])) {		
	$email =  $_POST['email'];	
	$password = $_POST['password'];
	$fpassword = md5($password);		

	$query = "SELECT * FROM `users` WHERE `user_email`='$email' AND `user_password`='$fpassword'";
					
	$results = mysqli_query($connect, $query);		
	if (mysqli_num_rows($results) == 1) {			
		$crow = mysqli_fetch_array($results);            		
		$_SESSION['first_name'] = $crow['first_name'];            		
		$_SESSION['last_name'] = $crow['last_name'];					
		$_SESSION['email'] = $email;																	
		$_SESSION['success'] = "You are now logged in";							
		header('location: dashboard.php');				
	}else {			
		//array_push($errors, "Wrong username/password combination");		
		header('location: index.php');					
	}		
}
?>

