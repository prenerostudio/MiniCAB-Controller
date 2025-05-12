<?php
include('config.php');
include('session.php');

header('Content-Type: application/json');

$d_id = $_POST['d_id'] ?? null;

if (!$d_id) {
    echo json_encode(['status' => 'error', 'message' => 'Driver ID missing']);
    exit;
}

// Same document check logic here...
$requiredTables = [ 'driving_license', 'adress_proofs', 'driver_extra', 'dvla_check', 'national_insurance', 'pco_license',
    'rental_agreement', 'vehicle_extra', 'vehicle_insurance', 'vehicle_ins_schedule',
    'vehicle_log_book', 'vehicle_mot', 'vehicle_pco', 'vehicle_pictures', 'vehicle_road_tax'
];

$allDocumentsUploaded = true;
foreach ($requiredTables as $table) {
    $checkSql = "SELECT 1 FROM `$table` WHERE `d_id` = '$d_id' LIMIT 1";
    $checkResult = mysqli_query($connect, $checkSql);
    if (!$checkResult || mysqli_num_rows($checkResult) == 0) {
        $allDocumentsUploaded = false;
        break;
    }
}

if ($allDocumentsUploaded) {
    $status = 1;
    $date = date("Y-m-d H:i:s");

    $sql = "UPDATE `drivers` SET `acount_status`='$status', `driver_reg_date`='$date' WHERE `d_id`='$d_id'";
    $result = $connect->query($sql);

    if ($result) {
        $activity_type = 'Driver Verified';
        $user_type = 'user';
        $details = "Driver $d_id has been verified by Controller.";

        $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`)
                   VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        mysqli_query($connect, $actsql);

        echo json_encode(['status' => 'success', 'message' => 'Driver approved successfully.']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to update driver status.']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Required documents are missing.']);
}
exit;
?>