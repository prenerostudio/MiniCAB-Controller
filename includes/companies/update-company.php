<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json');

$com_id   = $_POST['com_id'] ?? '';
$cname    = $_POST['cname'] ?? '';
$rpname   = $_POST['rpname'] ?? '';
$cemail   = $_POST['cemail'] ?? '';
$cpin     = $_POST['cpin'] ?? '';
$pc       = $_POST['pc'] ?? '';
$caddress = $_POST['caddress'] ?? '';

if (empty($com_id) || empty($cname) || empty($cemail)) {
    echo json_encode([
        "status" => "error",
        "message" => "All required fields must be filled"
    ]);
    exit;
}

$sql = "UPDATE companies SET com_name = ?, com_person = ?, com_email = ?, com_pin = ?, postal_code = ?, com_address = ? WHERE com_id = ?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("ssssssi", $cname, $rpname, $cemail, $cpin, $pc, $caddress, $com_id);

if ($stmt->execute()) {

    // Activity log
    $activity_type = 'Company Updated';
    $user_type = 'user';
    $details = "Company ($cname) updated by Controller";
    mysqli_query($connect, "INSERT INTO activity_log(activity_type, user_type, user_id, details) VALUES ('$activity_type', '$user_type', '$myId', '$details')");

    echo json_encode([
        "status" => "success",
        "message" => "Company updated successfully"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Failed to update company"
    ]);
}

$stmt->close();
$connect->close();
?>