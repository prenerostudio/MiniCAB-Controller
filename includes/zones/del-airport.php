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

$ap_id = intval($_POST['ap_id'] ?? 0);

if ($ap_id <= 0) {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid airport ID"
    ]);
    exit;
}

/* Delete Airport */
$stmt = $connect->prepare("DELETE FROM airports WHERE ap_id = ?");
$stmt->bind_param("i", $ap_id);

if ($stmt->execute()) {

    /* Activity Log */
    $activity_type = 'Airport Deleted';
    $user_type     = 'user';
    $details       = "Airport has been deleted by Controller.";

    $logStmt = $connect->prepare("
        INSERT INTO activity_log (activity_type, user_type, user_id, details)
        VALUES (?, ?, ?, ?)
    ");
    $logStmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $logStmt->execute();

    echo json_encode([
        "status" => "success",
        "message" => "Airport deleted successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to delete airport"
    ]);
}

$connect->close();
