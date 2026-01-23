<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

$company_id = $_POST['company_id'] ?? '';

if (!$company_id) {
    echo json_encode(['status'=>'error','message'=>'Invalid request']);
    exit;
}

// Get current logo
$stmt = $connect->prepare("SELECT com_logo FROM company WHERE company_id=?");
$stmt->bind_param("i", $company_id);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();

if (!$row || empty($row['com_logo'])) {
    echo json_encode(['status'=>'error','message'=>'No logo found']);
    exit;
}

$logoPath = "img/companies/" . $row['com_logo'];

// Delete file from server
if (file_exists($logoPath)) {
    unlink($logoPath);
}

// Update database
$update = $connect->prepare("UPDATE company SET com_logo=NULL WHERE company_id=?");
$update->bind_param("i", $company_id);

if ($update->execute()) {

    // Activity Log
    $activity_type = 'Company Logo Deleted';
    $user_type = 'user';
    $details = "Company logo has been deleted.";

    $log = $connect->prepare("
        INSERT INTO activity_log (activity_type, user_type, user_id, details)
        VALUES (?,?,?,?)
    ");
    $log->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $log->execute();

    echo json_encode(['status'=>'success','message'=>'Company logo deleted successfully']);

} else {
    echo json_encode(['status'=>'error','message'=>'Failed to update database']);
}
