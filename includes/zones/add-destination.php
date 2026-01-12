<?php
require '../../configuration.php';
include('../../session.php');
header('Content-Type: application/json');
$des_name    = $_POST['des_name'] ?? '';
$des_address = $_POST['des_address'] ?? '';
if (empty($des_name) || empty($des_address)) {
    echo json_encode([
        'status' => 'error',
        'message' => 'All fields are required.'
    ]);
    exit;
}
// Prepared Statement (Security Best Practice)
$stmt = $connect->prepare("INSERT INTO destinations (des_name, des_address) VALUES (?, ?)");
$stmt->bind_param("ss", $des_name, $des_address);
if ($stmt->execute()) {
    // Activity Log
    $activity_type = 'New Destination Added';
    $user_type = 'user';
    $details = 'New Destination Has Been Added by Controller.';
    $logStmt = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)"    );
    $logStmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $logStmt->execute();
    echo json_encode([
        'status' => 'success',
        'message' => 'Destination added successfully!'
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to add destination.'
    ]);
}

$stmt->close();
$connect->close();
?>