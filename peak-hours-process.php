<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include('config.php');
include('session.php');

// Retrieve POST data
$st = $_POST['st'];
$et = $_POST['et'];
$days = implode(", ", $_POST['days']);
$price = $_POST['price'];

// Prepare the SQL statement for inserting peak hours
$stmt = $connect->prepare("INSERT INTO `peak_hours` (`start_time`, `end_time`, `peak_hours_days`, `price_increment`) VALUES (?, ?, ?, ?)");
$stmt->bind_param("sssd", $st, $et, $days, $price);

// Check for errors before executing
if (!$stmt) {
    die('Prepare failed: ' . $connect->error);
}

if ($stmt->execute()) {
    // Log the activity
    $activity_type = 'Peak Hours Charges Added';
    $user_type = 'Controller';
    $details = 'New Peak Hours Charges have been added by Controller.';

    $actstmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $actstmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    
    if (!$actstmt) {
        die('Prepare failed for activity log: ' . $connect->error);
    }
    
    if ($actstmt->execute()) {
        // Redirect on success
        header('Location: pricing.php');
        exit();
    } else {
        echo 'Error executing activity log query: ' . $actstmt->error;
    }
} else {
    echo 'Error executing peak hours query: ' . $stmt->error; 
}

// Close connections
$stmt->close();
if (isset($actstmt)) {
    $actstmt->close();
}
$connect->close();
?>
