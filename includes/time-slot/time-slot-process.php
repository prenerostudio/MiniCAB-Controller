<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json; charset=UTF-8');

$ts_date = $_POST['mdate'] ?? '';
$stime  = $_POST['stime'] ?? '';
$etime  = $_POST['etime'] ?? '';
$pph = $_POST['pph'] ?? '';

if (empty($ts_date) || empty($stime) || empty($etime) || empty($pph)) {
    echo json_encode(["status" => "error", "message" => "All fields are required."]);
    exit;
}

$sptime = strtotime($stime);
$eptime = strtotime($etime);

if ($eptime <= $sptime) {
    echo json_encode(["status" => "error", "message" => "End time must be after start time."]);
    exit;
}

// Calculate total time in hours and total payment
$total_time = ($eptime - $sptime) / 3600; 
$total_pay = $pph * $total_time;
$total_pay_formatted = number_format($total_pay, 2);

$sql = "INSERT INTO `time_slots` (`ts_date`, `start_time`, `end_time`, `price_hour`, `total_pay`) 
        VALUES ('$ts_date', '$stime', '$etime', '$pph', '$total_pay_formatted')";

$result = mysqli_query($connect, $sql);

if ($result) {
    $activity_type = 'Time Slot Added';    
    $user_type = 'user';    
    $details = "New Time Slot ($ts_date $stime-$etime) added by Controller.";
    
    $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`) 
               VALUES ('$activity_type', '$user_type', '$myId', '$details')";
    mysqli_query($connect, $actsql);

    echo json_encode(["status" => "success", "message" => "Time slot added successfully!"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to add time slot."]);
}

$connect->close();
?>