<?php
session_start(); 

// Initialize session variables with default values if they are not set
$myId = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;
$email = isset($_SESSION['email']) ? $_SESSION['email'] : null;
$fname = isset($_SESSION['first_name']) ? $_SESSION['first_name'] : null;
$lname = isset($_SESSION['last_name']) ? $_SESSION['last_name'] : null;
$userphone = isset($_SESSION['user_phone']) ? $_SESSION['user_phone'] : null;
$user_pic = isset($_SESSION['user_pic']) ? $_SESSION['user_pic'] : null;
$designation = isset($_SESSION['designation']) ? $_SESSION['designation'] : null;

// Redirect if user_id is not set
if (!isset($_SESSION['email'])) {
    $_SESSION['msg'] = "You must log in first";
    header('Location: index.php');
    exit(); // Ensure that no further code is executed after the redirect
}
?>
