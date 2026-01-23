<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json');

$r_name    = $_POST['r_name'] ?? '';
$r_address = $_POST['r_address'] ?? '';

// Validation
if (empty($r_name) || empty($r_address)) {
    echo json_encode([
        "status" => "error",
        "message" => "All fields are required"
    ]);
    exit;
}
// Insert railway station
$sql = "INSERT INTO railway_stations (rail_name, rail_address) VALUES ('$r_name', '$r_address')";
$result = mysqli_query($connect, $sql);
if ($result) {
    // Activity log
    $activity_type = 'Railway Station Added';
    $user_type     = 'user';
    $details       = 'Railway Station has been added by Controller';
    $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES ('$activity_type', '$user_type', '$myId', '$details')";
    mysqli_query($connect, $actsql);
    echo json_encode([
        "status" => "success",
        "message" => "Railway station added successfully"
    ]);
    exit;
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to add railway station"
    ]);
    exit;
}

$connect->close();
?>