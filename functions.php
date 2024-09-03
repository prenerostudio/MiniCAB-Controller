<?php
include('config.php');
session_start();

if (isset($_POST['login_user'])) {    
    $email = mysqli_real_escape_string($connect, $_POST['email']);
    $password = mysqli_real_escape_string($connect, $_POST['password']);
    
    
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
        $_SESSION['full_name'] = $crow['first_name'] . " " . $crow['last_name'];

        $activity_type = 'Controller Logged-In';
        $user_type = 'user';
        $details = "Controller logged in successfully.";
        $myId = $_SESSION['user_id'];        
        $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
                   VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        $actr = mysqli_query($connect, $actsql);
        header('location: dashboard.php');
        exit();
    } else {        
        header('location: index.php');
        exit();
    }
}
?>