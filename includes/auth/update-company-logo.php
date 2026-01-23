<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status'=>'error','message'=>'Invalid request']);
    exit;
}

$company_id = $_POST['company_id'] ?? '';

if (!$company_id || !isset($_FILES['fileToUpload'])) {
    echo json_encode(['status'=>'error','message'=>'Missing data']);
    exit;
}

$targetDir = "../../img/companies/";
$allowed = ['jpg','jpeg','png','gif','webp','svg','avif'];

$ext = strtolower(pathinfo($_FILES['fileToUpload']['name'], PATHINFO_EXTENSION));

if (!in_array($ext, $allowed)) {
    echo json_encode(['status'=>'error','message'=>'Invalid file type']);
    exit;
}

$uniqueID = uniqid();
$fileName = $uniqueID . '_' . basename($_FILES['fileToUpload']['name']);
$targetFile = $targetDir . $fileName;

if (!move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $targetFile)) {
    echo json_encode(['status'=>'error','message'=>'Upload failed']);
    exit;
}

$sql = "UPDATE company SET com_logo=? WHERE company_id=?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("si", $fileName, $company_id);

if ($stmt->execute()) {

    // Activity Log
    $activity_type = 'Company Logo Updated';
    $user_type = 'user';
    $details = "Company logo has been updated.";

    $act = $connect->prepare("
        INSERT INTO activity_log (activity_type, user_type, user_id, details)
        VALUES (?,?,?,?)
    ");
    $act->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $act->execute();

    echo json_encode(['status'=>'success','message'=>'Company logo updated successfully']);

} else {
    echo json_encode(['status'=>'error','message'=>'Database update failed']);
}
?>