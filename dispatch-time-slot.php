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
$stmt->bind_param("iii", $d_id, $status, $ts_id); // Corrected parameter order
$result = $stmt->execute();

if ($result) {
    
    $fetchsql = "SELECT time_slots.*, drivers.* FROM time_slots 
                 JOIN drivers ON time_slots.d_id = drivers.d_id 
                 WHERE time_slots.ts_id = ? AND time_slots.d_id = ?";

    $fetchstmt = $connect->prepare($fetchsql);
    $fetchstmt->bind_param("ii", $ts_id, $d_id);
    $fetchstmt->execute();
    $fetchr = $fetchstmt->get_result();    
    $output = $fetchr->fetch_all(MYSQLI_ASSOC);

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
    $pusher->trigger('times-channel', 'slot-dispatched', $data);

    header('Location: available-time-slots.php');
    exit();
} else {
    header('Location: available-time-slots.php');
    exit();
}

$connect->close();
?>
