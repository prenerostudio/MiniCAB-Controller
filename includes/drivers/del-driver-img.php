<?php
header('Content-Type: application/json');
include('../../configuration.php');
include('../../session.php');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => false, 'message' => 'Invalid request']);
    exit;
}

$d_id = $_POST['d_id'] ?? null;
if (!$d_id) {
    echo json_encode(['status' => false, 'message' => 'Missing driver ID']);
    exit;
}

// Get old image
$result = mysqli_query($connect, "SELECT d_pic FROM drivers WHERE d_id = '$d_id'");
$row = mysqli_fetch_assoc($result);
$oldImage = $row['d_pic'] ?? '';

if ($oldImage && file_exists("../../img/drivers/" . $oldImage)) {
    unlink("../../img/drivers/" . $oldImage); // delete file from folder
}

// Update DB
$sql = "UPDATE drivers SET d_pic = '' WHERE d_id = '$d_id'";
if (mysqli_query($connect, $sql)) {
    $activity_type = 'Driver Profile Image Deleted';
    $user_type = 'user';
    $details = "Driver profile image for driver ID $d_id deleted by controller.";
    $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details)
               VALUES ('$activity_type', '$user_type', '$myId', '$details')";
    mysqli_query($connect, $actsql);

    echo json_encode(['status' => true, 'message' => 'Driver image deleted successfully']);
} else {
    echo json_encode(['status' => false, 'message' => 'Database update failed']);
}
?>
