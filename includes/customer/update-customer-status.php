<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

$c_id = $_POST['id'] ?? null;
if (!$c_id) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request.']);
    exit();
}

$status = 1;
$date = date('Y-m-d H:i:s');

$sql = "UPDATE `clients` SET `acount_status`=?, `cus_updated_at`=? WHERE `c_id`=?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("isi", $status, $date, $c_id);

if ($stmt->execute()) {
    $activity_type = 'Customer Verified';
    $user_type = 'user';
    $details = "Customer $c_id has been verified by Controller.";

    mysqli_query($connect, "INSERT INTO `activity_log`(`activity_type`,`user_type`,`user_id`,`details`) 
                            VALUES ('$activity_type','$user_type','$myId','$details')");

    echo json_encode(['status' => 'success', 'message' => 'Customer has been approved successfully.']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Failed to approve customer.']);
}

$stmt->close();
$connect->close();
?>
