<?php
header('Content-Type: application/json');
include("../../configuration.php");

// Function for clean JSON response
function response($status, $message, $data = null)
{
    echo json_encode([
        'status' => $status,
        'message' => $message,
        'data' => $data
    ]);
    exit;
}

// Validate required fields
$required = ['dname', 'demail', 'dphone', 'dpass', 'dshift', 'dpco'];
foreach ($required as $field) {
    if (empty($_POST[$field])) {
        response(false, "Missing required field: $field");
    }
}

// Sanitize inputs
$d_name   = trim($_POST['dname']);
$d_email  = trim($_POST['demail']);
$d_phone  = trim($_POST['dphone']);
$raw_pass = $_POST['dpass'];
$d_pco    = trim($_POST['dpco']);
$d_shift  = trim($_POST['dshift']);

$acount_status = 0;
$signup_type   = 2;
$created_at    = date('Y-m-d H:i:s');
$d_password    = password_hash($raw_pass, PASSWORD_DEFAULT);

// Check for existing driver
$check = $connect->prepare("SELECT d_id FROM drivers WHERE d_phone = ? OR d_email = ?");
$check->bind_param("ss", $d_phone, $d_email);
$check->execute();
$check->store_result();

if ($check->num_rows > 0) {
    $check->close();
    response(false, "This driver already exists! Try signing in instead.");
}
$check->close();

// Insert driver
$stmt = $connect->prepare("
    INSERT INTO drivers 
    (d_name, d_email, d_phone, d_password, d_shift, d_pco, acount_status, signup_type, driver_reg_date)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
");
$stmt->bind_param("ssssssiis", $d_name, $d_email, $d_phone, $d_password, $d_shift, $d_pco, $acount_status, $signup_type, $created_at);

if ($stmt->execute()) {
    $d_id = $stmt->insert_id;
    $stmt->close();

    // Create related record in driver_vehicle
    $connect->query("INSERT INTO driver_vehicle (d_id) VALUES ('$d_id')");

    // Log activity
    $activity_type = 'New Driver Profile Registered';
    $user_type     = 'driver';
    $details       = "New Driver Account Created by $d_name";

    $log = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)");
    $log->bind_param("ssis", $activity_type, $user_type, $d_id, $details);
    $log->execute();
    $log->close();

    response(true, "Driver registered successfully", ['driver_id' => $d_id]);
} else {
    response(false, "Error occurred while registering the driver. Please try again.");
}

$connect->close();
?>
