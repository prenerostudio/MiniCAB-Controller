<?php
include('config.php');
session_start();

if (isset($_POST['login_user'])) {
    // Get the email and password from the form
    $email = mysqli_real_escape_string($connect, $_POST['email']);
    $password = mysqli_real_escape_string($connect, $_POST['password']);
    
    // Encrypt the password using md5
    $fpassword = md5($password);
    
    // Prepare the SQL query to fetch the user
    $query = "SELECT * FROM `users` WHERE `user_email`='$email' AND `user_password`='$fpassword'";
    $results = mysqli_query($connect, $query);
    
    if (mysqli_num_rows($results) == 1) {
        $crow = mysqli_fetch_array($results);

        // Set session variables
        $_SESSION['email'] = $email;
        $_SESSION['first_name'] = $crow['first_name'];
        $_SESSION['last_name'] = $crow['last_name'];
        $_SESSION['user_phone'] = $crow['user_phone'];
        $_SESSION['user_id'] = $crow['user_id'];
        $_SESSION['user_pic'] = $crow['user_pic'];
        $_SESSION['designation'] = $crow['designation'];
        $_SESSION['success'] = "You are now logged in";
        $_SESSION['full_name'] = $crow['first_name'] . " " . $crow['last_name'];

        // Activity log details
        $activity_type = 'Controller Logged-In';
        $user_type = 'user';
        $details = "Controller $_SESSION['first_name'] logged in successfully.";
        $myId = $_SESSION['user_id']; // Set $myId based on the logged-in user's ID

        // Insert the activity log
        $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
                   VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        $actr = mysqli_query($connect, $actsql);

        // Redirect to the dashboard
        header('location: dashboard.php');
        exit();
    } else {
        // Redirect back to the login page if login fails
        header('location: index.php');
        exit();
    }
}
?>
