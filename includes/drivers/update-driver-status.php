<?php
// includes/drivers/update-driver-status.php
declare(strict_types=1);

error_reporting(0); // suppress notices in production; during dev consider error_reporting(E_ALL)
ini_set('display_errors', '0');

require_once '../../configuration.php'; // ensure this sets $connect
require_once '../../session.php';       // ensure this sets $myId (controller user id)

header('Content-Type: application/json; charset=utf-8'); // <-- semicolon fixed

// Validate DB connection
if (!isset($connect) || !$connect) {
    echo json_encode(['status' => 'error', 'message' => 'Database connection not available.']);
    exit;
}

$d_id = $_POST['d_id'] ?? null;
$d_id = trim($d_id);

if (empty($d_id)) {
    echo json_encode(['status' => 'error', 'message' => 'Driver ID missing']);
    exit;
}

// sanitize - if d_id numeric, cast; otherwise escape
if (ctype_digit($d_id)) {
    $d_id_safe = $d_id;
} else {
    $d_id_safe = mysqli_real_escape_string($connect, $d_id);
}

// Required document tables
$requiredTables = [
    'driving_license','address_proofs','driver_extras','dvla_check','national_insurance','pco_license',
    'rental_agreement','vehicle_extras','vehicle_insurance','vehicle_ins_schedule',
    'vehicle_log_book','vehicle_mot','vehicle_pco','vehicle_pictures','vehicle_road_tax'
];

$allDocumentsUploaded = true;
foreach ($requiredTables as $table) {
    // ensure table name is safe (simple whitelist - already provided above)
    $table_safe = mysqli_real_escape_string($connect, $table);
    $checkSql = "SELECT 1 FROM `{$table_safe}` WHERE `d_id` = '{$d_id_safe}' LIMIT 1";
    $checkResult = mysqli_query($connect, $checkSql);
    if (!$checkResult || mysqli_num_rows($checkResult) == 0) {
        $allDocumentsUploaded = false;
        break;
    }
}

if (!$allDocumentsUploaded) {
    echo json_encode(['status' => 'error', 'message' => 'Required documents are missing.']);
    exit;
}

// Update driver status
$status = 1;
$date = date("Y-m-d H:i:s");
$updateSql = "UPDATE `drivers` SET `acount_status` = ?, `driver_update_at` = ? WHERE `d_id` = ?";

$stmt = mysqli_prepare($connect, $updateSql);
if ($stmt) {
    mysqli_stmt_bind_param($stmt, "iss", $status, $date, $d_id_safe);
    $exec = mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);

    if ($exec) {
        // Log activity - use prepared insert
        $activity_type = 'Driver Verified';
        $user_type = 'user';
        // make a safe details string
        $details = "Driver {$d_id_safe} has been verified by Controller.";

        $actSql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";
        $actStmt = mysqli_prepare($connect, $actSql);
        if ($actStmt) {
            mysqli_stmt_bind_param($actStmt, "ssis", $activity_type, $user_type, $myId, $details);
            mysqli_stmt_execute($actStmt);
            mysqli_stmt_close($actStmt);
        }

        echo json_encode(['status' => 'success', 'message' => 'Driver approved successfully.']);
        exit;
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to update driver status.']);
        exit;
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Database error (prepare failed).']);
    exit;
}
