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
$ap_name    = trim($_POST['ap_name'] ?? '');
$ap_address = trim($_POST['ap_address'] ?? '');
if ($ap_name === '' || $ap_address === '') {
    echo json_encode([
        "status" => "error",
        "message" => "All fields are required"
    ]);
    exit;
}
/* Insert Airport */
$stmt = $connect->prepare("INSERT INTO airports (ap_name, ap_address) VALUES (?, ?)");
$stmt->bind_param("ss", $ap_name, $ap_address);
if ($stmt->execute()) {
    /* Activity Log */
    $activity_type = 'New Airport Added';
    $user_type     = 'user';
    $details       = "New Airport ($ap_name) has been added by Controller.";
    $logStmt = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)");
    $logStmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $logStmt->execute();
    echo json_encode([
        "status" => "success",
        "message" => "Airport added successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to add airport"
    ]);
}

$connect->close();
?>