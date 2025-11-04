<?php
include('../../configuration.php');
include('../../session.php');
header('Content-Type: application/json');

// Validate input
if (!isset($_POST['d_id']) || empty($_POST['d_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid driver ID.']);
    exit();
}

$d_id = intval($_POST['d_id']);
$status = 1;

// Update driver
$stmt = $connect->prepare("UPDATE `drivers` SET `acount_status` = ? WHERE `d_id` = ?");
$stmt->bind_param("ii", $status, $d_id);

if ($stmt->execute()) {
    $stmt->close();

    // Log activity
    $activity_type = 'Activate Driver';        		
    $user_type = 'User';        		
    $details = "Driver ID: " . $d_id . " has been activated.";

    $log = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $log->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $log->execute();
    $log->close();

    echo json_encode(['status' => 'success', 'message' => 'Driver has been successfully activated.']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Failed to activate driver. Try again later.']);
}

$connect->close();
?>
