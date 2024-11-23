<?php
include('config.php');
include('session.php'); 
require 'vendor/autoload.php'; // Load Pusher
	
$ts_id = $_GET['ts_id'];
$d_id = 0;
$status = 3;
$sql = "UPDATE `time_slots` SET `d_id`='$d_id', `ts_status`='$status' WHERE `ts_id`='$ts_id'";
$result = $connect->query($sql);

if($result){ 	

    $activity_type = 'Time Slot Withdrawn';	

    $user_type = 'user';	

    $details = "Time Slot Has Been Withdrawn by Controller.";
	

    $actsql = "INSERT INTO `activity_log`(
					`activity_type`, 
					`user_type`, 
					`user_id`, 
					`details`
					) VALUES (
					'$activity_type',
					'$user_type',
					'$myId',
					'$details')";	

    $actr = mysqli_query($connect, $actsql);		
	
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
        'message' => "Time Slot $ts_id has been withdrawn.",
        'd_id' => $d_id,
        'ts_id' => $ts_id
    ];

    // Trigger the event on 'jobs-channel'
    
    $pusher->trigger('times-channel', 'slot-withdrawn', $data);
	

    header('location: available-time-slots.php');
} else {

    header('location: available-time-slots.php');
}
?>