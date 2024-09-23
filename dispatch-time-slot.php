<?php
include('config.php');
include('session.php');
require 'vendor/autoload.php'; // Load Pusher


$ts_id = $_POST['ts_id'];
$d_id = $_POST['d_id'];
$status = 5;
// Prepare and execute the job insertion
$sql = "UPDATE `time_slots` SET `d_id`= ?, `ts_status`= ? WHERE `ts_id`=?";

$stmt = $connect->prepare($sql);
$stmt->bind_param("iii", $d_id, $ts_id, $status);
$result = $stmt->execute();


if ($result) {
	
	$fetchsql = "SELECT * FROM `time_slots` WHERE `ts_id`= $ts_id AND `d_id`= $d_id";

    $fetchr = mysqli_query($connect, $fetchsql);    
    $output = mysqli_fetch_all($fetchr, MYSQLI_ASSOC); 
	
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
        'message' => 'A Time Slot has been dispatched',
        'details' => $output,
       
    ];

    // Trigger a Pusher event
    $pusher->trigger('jobs-channel', 'job-dispatched', $data);
	

    header('Location: available-time-slots.php');
    exit();
} else {
   header('Location: available-time-slots.php');
    exit();
}

$connect->close();
?>
