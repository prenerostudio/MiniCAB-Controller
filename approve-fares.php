<?php
include('config.php');
include('session.php');
require 'vendor/autoload.php'; // Load Pusher

$fare_id = $_GET['id'];
$status = 'Corrected';

// Prepare statement to prevent SQL injection
$stmt = $connect->prepare("UPDATE `fares` SET `fare_status`=? WHERE `fare_id`=?");
$stmt->bind_param('si', $status, $fare_id);

if ($stmt->execute()) { 
    
    $activity_type = 'Fare Correction';		
    $user_type = 'user';        	
    $details = "Controller has approved Fare against Fare ID: " . $fare_id;

    // Prepare activity log statement
    $actstmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $actstmt->bind_param('ssis', $activity_type, $user_type, $myId, $details);
	
    // Fetch the job details
    $fetchsql = "SELECT * FROM `fares` WHERE `fare_id`=?";
    $fetchstmt = $connect->prepare($fetchsql);
    $fetchstmt->bind_param("i", $fare_id);
    $fetchstmt->execute();
    $fetchresult = $fetchstmt->get_result();

    // Fetch the first row as an associative array
    $output = $fetchresult->fetch_assoc();
    
    // Extracting the fare components
    $journey_fare = $output['journey_fare'];
    $car_parking = $output['car_parking'];
    $waiting = $output['waiting'];
    $tolls = $output['tolls'];  
    $extras = $output['extras'];
    
    // Calculate the total cost
    $total_cost = $journey_fare + $car_parking + $waiting + $tolls + $extras;
    
    $fetchstmt->close();

    // Initialize Pusher
    $options = [
        'cluster' => 'ap2',
        'useTLS' => true
    ];
    $pusher = new Pusher\Pusher(
        '28691ac9c0c5ac41b64a',
        '9b7a65fedc30abd6a530',
        '1848550',
        $options
    );

    // Data to send via Pusher
    $data = [
        'message' => "Fares have been approved by controller.",
        'details' => $output,
        'total_fee' => $total_cost
    ];

    // Trigger the event on 'jobs-channel'
    $pusher->trigger('jobs-channel', 'fare-approved', $data);
    
    header('Location: fare-corrections.php');
    exit();	
} else {		
    // Log update error
    error_log("Failed to update fare status: " . $connect->error);
    header('Location: fare-corrections.php');
    exit();
}
?>
