<?php
include('../../configuration.php');
include('../../session.php');
require '../../vendor/autoload.php'; // Load Pusher

header('Content-Type: application/json');

$ts_id = $_POST['ts_id'] ?? '';
$d_id = $_POST['d_id'] ?? '';

if (empty($ts_id) || empty($d_id)) {
    echo json_encode(["status" => "error", "message" => "Missing required fields."]);
    exit;
}

$status = 5; // waiting for acceptance

$sql = "UPDATE `time_slots` SET `d_id`=?, `ts_status`=? WHERE `ts_id`=?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("iii", $d_id, $status, $ts_id);
$result = $stmt->execute();

if ($result) {
    $fetchsql = "SELECT time_slots.*, drivers.* 
                 FROM time_slots 
                 JOIN drivers ON time_slots.d_id = drivers.d_id 
                 WHERE time_slots.ts_id = ? AND time_slots.d_id = ?";
    $fetchstmt = $connect->prepare($fetchsql);
    $fetchstmt->bind_param("ii", $ts_id, $d_id);
    $fetchstmt->execute();
    $fetchr = $fetchstmt->get_result();
    $output = $fetchr->fetch_all(MYSQLI_ASSOC);

    // Pusher setup
    $options = ['cluster' => 'ap2', 'useTLS' => true];
    $pusher = new Pusher\Pusher(
        '28691ac9c0c5ac41b64a', 
        '9b7a65fedc30abd6a530', 
        '1848550', 
        $options
    );

    $data = [
        'message' => 'A Time Slot has been dispatched',
        'details' => $output,
    ];
    $pusher->trigger('times-channel', 'slot-dispatched', $data);

    // Activity log
    $activity_type = 'Time Slot Dispatched';
    $user_type = 'user';
    $details = "Time Slot #$ts_id dispatched to Driver #$d_id by Controller.";
    $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`)
               VALUES ('$activity_type','$user_type','$myId','$details')";
    mysqli_query($connect, $actsql);

    echo json_encode(["status" => "success", "message" => "Time slot dispatched successfully!"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to dispatch time slot."]);
}

$connect->close();
?>
