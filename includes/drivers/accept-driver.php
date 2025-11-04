<?php
include('../../configuration.php');
header('Content-Type: application/json');

if (!isset($_POST['d_id'])) {
    echo json_encode(["status" => "error", "message" => "Invalid request!"]);
    exit();
}

$d_id = intval($_POST['d_id']);

// Update driver status to approved (assuming 'acount_status' column)
$query = $connect->prepare("UPDATE drivers SET acount_status = 2 WHERE d_id = ?");
$query->bind_param("i", $d_id);

if ($query->execute()) {
    // Log activity (optional)
    $activity = "Driver Approved";
    $user_type = "Admin";
    $details = "Driver ID $d_id has been approved.";
    $log = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)");
    $log->bind_param("ssis", $activity, $user_type, $d_id, $details);
    $log->execute();
    $log->close();

    echo json_encode(["status" => "success", "message" => "Driver has been approved successfully."]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to approve driver. Try again later."]);
}

$query->close();
$connect->close();
?>
