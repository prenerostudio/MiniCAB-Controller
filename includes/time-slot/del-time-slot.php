<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json; charset=UTF-8');
error_reporting(E_ERROR | E_PARSE);

$ts_id = $_POST['ts_id'] ?? '';

if (empty($ts_id)) {
    echo json_encode(["status" => "error", "message" => "Missing time slot ID."]);
    exit;
}

$sql = "DELETE FROM time_slots WHERE ts_id = '$ts_id'";
$result = mysqli_query($connect, $sql);

if ($result) {
    $activity_type = 'Time Slot Deleted';
    $user_type = 'user';
    $details = "Time Slot ID $ts_id has been deleted by Controller.";

    $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details)
               VALUES ('$activity_type', '$user_type', '$myId', '$details')";
    mysqli_query($connect, $actsql);

    echo json_encode(["status" => "success", "message" => "Time slot deleted successfully."]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to delete time slot."]);
}
exit;
?>
