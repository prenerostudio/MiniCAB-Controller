<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');
$des_id = $_POST['des_id'] ?? '';
if (empty($des_id)) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid destination ID.'
    ]);
    exit;
}
// Prepared statement
$stmt = $connect->prepare("DELETE FROM destinations WHERE des_id = ?");
$stmt->bind_param("i", $des_id);
if ($stmt->execute()) {
    // Activity Log
    $activity_type = 'Destination Deleted';
    $user_type = 'user';
    $details = 'Destination Has Been Deleted by Controller.';
    $logStmt = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)"    );
    $logStmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $logStmt->execute();
    echo json_encode([
        'status' => 'success',
        'message' => 'Destination deleted successfully.'
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to delete destination.'
    ]);
}
$stmt->close();
$connect->close();
?>