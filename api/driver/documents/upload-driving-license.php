<?php
header('Content-Type: application/json');
include("../../../configuration.php");

// Simple Activity Logger
function logActivity($type, $user_type, $user_id, $details) {
    global $connect;
    $stmt = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $type, $user_type, $user_id, $details);
    $stmt->execute();
}

if (
    empty($_POST['d_id']) ||
    empty($_POST['dl_number']) ||
    empty($_POST['dl_expiry']) ||
	empty($_POST['dl_exp_time']) ||
    empty($_FILES['dl_front']) ||
    empty($_FILES['dl_back'])
) {
    echo json_encode(['status' => false, 'message' => 'Missing required fields.']);
    exit;
}

$d_id = $_POST['d_id'];
$dl_number = $_POST['dl_number'];
$dl_expiry = $_POST['dl_expiry'];
$dl_exp_time = $_POST['dl_exp_time'];
$date_now = date('Y-m-d H:i:s');

$targetDir = "../../../img/drivers/driving-license/";
$allowedExt = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'svg', 'ico', 'avif'];

// Validate file types
$frontExt = strtolower(pathinfo($_FILES['dl_front']['name'], PATHINFO_EXTENSION));
$backExt  = strtolower(pathinfo($_FILES['dl_back']['name'], PATHINFO_EXTENSION));

if (!in_array($frontExt, $allowedExt) || !in_array($backExt, $allowedExt)) {
    echo json_encode(['status' => false, 'message' => 'Invalid file type.']);
    exit;
}

// New unique file names
$dl_front = uniqid("front_") . "." . $frontExt;
$dl_back  = uniqid("back_") . "." . $backExt;

$path_front = $targetDir . $dl_front;
$path_back  = $targetDir . $dl_back;

// Move uploaded files
if (!move_uploaded_file($_FILES['dl_front']['tmp_name'], $path_front) ||
    !move_uploaded_file($_FILES['dl_back']['tmp_name'], $path_back)) {
    echo json_encode(['status' => false, 'message' => 'File upload failed.']);
    exit;
}

// Check if driver record exists
$check = $connect->prepare("SELECT * FROM driving_license WHERE d_id = ?");
$check->bind_param("s", $d_id);
$check->execute();
$result = $check->get_result();

if ($result->num_rows > 0) {
    // Delete old files
    $old = $result->fetch_assoc();
    if (!empty($old['dl_front']) && file_exists($targetDir . $old['dl_front'])) unlink($targetDir . $old['dl_front']);
    if (!empty($old['dl_back']) && file_exists($targetDir . $old['dl_back'])) unlink($targetDir . $old['dl_back']);

    // Update record
    $update = $connect->prepare("
        UPDATE driving_license 
        SET dl_number=?, dl_expiry=?, `dl_expiry_time`=?, dl_front=?, dl_back=?, dl_updated_at=? 
        WHERE d_id=?");
    $update->bind_param("ssssssi", $dl_number, $dl_expiry, $dl_exp_time, $dl_front, $dl_back, $date_now, $d_id);
    $update->execute();

    logActivity('Driving License Updated', 'driver', $d_id, "License updated for Driver $d_id.");

    echo json_encode(['status' => true, 'message' => 'License updated successfully.']);
} else {
    // Insert new record
    $insert = $connect->prepare("
        INSERT INTO driving_license (d_id, dl_number, dl_expiry, dl_expiry_time, dl_front, dl_back, dl_created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?)");
    $insert->bind_param("issssss", $d_id, $dl_number, $dl_expiry, $dl_exp_time, $dl_front, $dl_back, $date_now);
    $insert->execute();

    logActivity('Driving License Added', 'driver', $d_id, "License added for Driver $d_id.");

    echo json_encode(['status' => true, 'message' => 'License uploaded successfully.']);
}
?>
