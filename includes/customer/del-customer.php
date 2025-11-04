<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

$c_id = $_POST['c_id'] ?? null;

if (!$c_id) {
    echo json_encode(["status" => "error", "message" => "Invalid request."]);
    exit();
}

$status = 2;
$date_update = date('Y-m-d H:i:s');

$sql = "UPDATE `clients` SET `acount_status`=?, `cus_updated_at`=? WHERE `c_id`=?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("isi", $status, $date_update, $c_id);

if ($stmt->execute()) {
    // Log deletion
    $activity_type = 'Customer Profile Deleted';
    $user_type = 'user';
    $details = "Customer Profile ID #$c_id has been deleted by Controller.";

    $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`) 
               VALUES ('$activity_type', '$user_type', '$myId', '$details')";
    mysqli_query($connect, $actsql);

    echo json_encode(["status" => "success", "message" => "Customer profile has been deactivated successfully."]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to delete customer. Please try again."]);
}

$stmt->close();
$connect->close();
exit();
?>
