<?php
include('../../configuration.php');
include('../../session.php');
require '../../vendor/autoload.php'; // Load Pusher

if (!isset($_POST['ts_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Missing time slot ID']);
    exit;
}

$ts_id = $_POST['ts_id'];
$d_id = 0;
$status = 3;

// Update time slot
$sql = "UPDATE `time_slots` SET `d_id`=?, `ts_status`=? WHERE `ts_id`=?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("iii", $d_id, $status, $ts_id);
$result = $stmt->execute();

if ($result) {
    // Log activity
    $activity_type = 'Time Slot Withdrawn';
    $user_type = 'user';
    $details = "Time Slot Has Been Withdrawn by Controller.";

    $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`) 
               VALUES (?, ?, ?, ?)";
    $actstmt = $connect->prepare($actsql);
    $actstmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $actstmt->execute();

    // Initialize Pusher
    $options = ['cluster' => 'ap2', 'useTLS' => true];
    $pusher = new Pusher\Pusher(
        '28691ac9c0c5ac41b64a',
        '9b7a65fedc30abd6a530',
        '1848550',
        $options
    );

    // Trigger event
    $data = [
        'message' => "Time Slot $ts_id has been withdrawn.",
        'd_id' => $d_id,
        'ts_id' => $ts_id
    ];
    $pusher->trigger('times-channel', 'slot-withdrawn', $data);

    echo json_encode(['status' => 'success', 'message' => 'Time Slot withdrawn successfully!']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Failed to withdraw time slot.']);
}
?>
