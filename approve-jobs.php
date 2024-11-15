<?php
include('config.php');
include('session.php');
require 'vendor/autoload.php'; // Load Pusher

$job_id = $_GET['job_id'];
$status = 1;

// Prepare statement to prevent SQL injection
$stmt = $connect->prepare("UPDATE `jobs` SET `ride_status`=? WHERE `job_id`=?");
$stmt->bind_param('ii', $status, $job_id);

if ($stmt->execute()) { 
    
    $activity_type = 'Job Approval';		
    $user_type = 'user';        	
    $details = "Controller has approved Job JOB ID: $job_id";

    // Prepare activity log statement
    $actstmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $actstmt->bind_param('ssis', $activity_type, $user_type, $myId, $details);
	
    header('Location: completed-booking.php');
    exit();	
} else {		
    // Log update error
    error_log("Failed to update fare status: " . $connect->error);
    header('Location: completed-booking.php');
    exit();
}
?>
