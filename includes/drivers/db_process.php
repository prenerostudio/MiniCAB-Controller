<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json'); // ✅ must include semicolon!

$d_id = $_POST['d_id'] ?? null;
$bank_name = $_POST['bank_name'] ?? '';
$acc_num = $_POST['acc_num'] ?? '';
$sort_code = $_POST['sort_code'] ?? '';
$date = date("Y-m-d H:i:s");

if (!$d_id || !$bank_name || !$acc_num || !$sort_code) {
    echo json_encode(['status' => 'error', 'message' => 'All fields are required.']);
    exit;
}

// Insert into driver_bank_details
$sql = "INSERT INTO `driver_bank_details`(
            `d_id`, 
            `bank_name`, 
            `account_number`, 
            `sort_code`, 
            `date_added`
        ) VALUES (
            '$d_id',
            '$bank_name',
            '$acc_num',
            '$sort_code',
            '$date'
        )";

$result = mysqli_query($connect, $sql);

if ($result) {
    $activity_type = 'Bank Account Added';
    $user_type = 'user';
    $details = "Bank account added for driver ID: $d_id by Controller.";

    $actsql = "INSERT INTO `activity_log`(
                    `activity_type`, 
                    `user_type`, 
                    `user_id`, 
                    `details`
                ) VALUES (
                    '$activity_type',
                    '$user_type',
                    '$myId',
                    '$details'
                )";
    mysqli_query($connect, $actsql);

    echo json_encode(['status' => 'success', 'message' => 'Bank details saved successfully.']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Database error: ' . mysqli_error($connect)]);
}

$connect->close();
exit;
?>
