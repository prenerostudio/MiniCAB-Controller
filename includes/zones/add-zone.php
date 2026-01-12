<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json');
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid request"
    ]);
    exit;
}
$za = trim($_POST['za'] ?? '');
if ($za === '') {
    echo json_encode([
        "status" => "error",
        "message" => "Zone name is required"
    ]);
    exit;
}
/* Insert Zone */
$stmt = $connect->prepare("INSERT INTO zones (zone_name) VALUES (?)");
$stmt->bind_param("s", $za);
if ($stmt->execute()) {
    /* Activity Log */
    $activity_type = 'New Zone Added';
    $user_type     = 'user';
    $details       = "New Zone ($za) has been added by Controller.";
    $logStmt = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)");
    $logStmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $logStmt->execute();
    echo json_encode([
        "status" => "success",
        "message" => "Zone added successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to add zone"
    ]);
}

$connect->close();
?>