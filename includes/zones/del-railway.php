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

$rail_id = intval($_POST['rail_id'] ?? 0);

if ($rail_id <= 0) {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid Rail ID"
    ]);
    exit;
}
/* Delete Zone */
$stmt = $connect->prepare("DELETE FROM `railway_stations` WHERE `rail_id` = ?");
$stmt->bind_param("i", $rail_id);
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
        "message" => "Railway deleted successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to delete Railway"
    ]);
}
$connect->close();
?>