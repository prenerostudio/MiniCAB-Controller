<?php
include('../../configuration.php');
include('../../session.php');
header('Content-Type: application/json');

if (!isset($_POST['d_id']) || empty($_POST['d_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid driver ID.']);
    exit();
}

$d_id = intval($_POST['d_id']);
$status = 5;
$date_update = date('Y-m-d H:i:s');

// Update driver status
$update = $connect->prepare("UPDATE `drivers` SET `acount_status` = ? WHERE `d_id` = ?");
$update->bind_param("ii", $status, $d_id);

if ($update->execute()) {
    $update->close();

    // Log in delete_drivers table
    $del_status = 0;
    $insert = $connect->prepare("INSERT INTO `delete_drivers`(`d_id`, `req_status`, `del_d_date`) VALUES (?, ?, ?)");
    $insert->bind_param("iis", $d_id, $del_status, $date_update);
    $insert->execute();
    $insert->close();

    // Add activity log
    $activity_type = 'Driver Profile Deleted';
    $user_type = 'Admin';
    $details = "Driver (ID: $d_id) profile deleted.";
    $log = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $log->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $log->execute();
    $log->close();

    echo json_encode(['status' => 'success', 'message' => 'Driver profile deleted successfully.']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Failed to delete driver. Try again later.']);
}

$connect->close();
?>
