<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid request"
    ]);
    exit;
}

$zone_id = intval($_POST['zone_id'] ?? 0);

if ($zone_id <= 0) {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid zone ID"
    ]);
    exit;
}

/* Delete Zone */
$stmt = $connect->prepare("DELETE FROM zones WHERE zone_id = ?");
$stmt->bind_param("i", $zone_id);

if ($stmt->execute()) {

    /* Activity Log */
    $activity_type = 'Zone Deleted';
    $user_type     = 'user';
    $details       = "Zone has been deleted by Controller.";

    $logStmt = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)");
    $logStmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $logStmt->execute();

    echo json_encode([
        "status" => "success",
        "message" => "Zone deleted successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to delete zone"
    ]);
}

$connect->close();
?>