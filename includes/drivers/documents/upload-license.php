<?php
include('../../../configuration.php');
include('../../../session.php');
header('Content-Type: application/json');
error_reporting(0); // hide PHP warnings from corrupting JSON output
ob_clean();

$response = [];

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status'=>'error','message'=>'Invalid request method']);
    exit;
}

$d_id = $_POST['d_id'] ?? '';
$dl_num = $_POST['licene_number'] ?? '';
$dl_expy = $_POST['licence_exp'] ?? '';
$li_exp_time = $_POST['li_exp_time'] ?? '';
$date_update = date('Y-m-d H:i:s');
$targetDir = "../../../img/drivers/driving-license/";

$allowTypes = ['jpg','jpeg','png','gif','bmp','pdf','webp','tiff','svg','heif','avif'];

if (empty($_FILES['dl_front']['name']) || empty($_FILES['dl_back']['name'])) {
    echo json_encode(['status'=>'error','message'=>'Both license images are required.']);
    exit;
}

$frontExt = strtolower(pathinfo($_FILES['dl_front']['name'], PATHINFO_EXTENSION));
$backExt  = strtolower(pathinfo($_FILES['dl_back']['name'], PATHINFO_EXTENSION));

if (!in_array($frontExt, $allowTypes) || !in_array($backExt, $allowTypes)) {
    echo json_encode(['status'=>'error','message'=>'Invalid file type.']);
    exit;
}

$dl_front = uniqid() . "." . $frontExt;
$dl_back  = uniqid() . "." . $backExt;

if (
    move_uploaded_file($_FILES['dl_front']['tmp_name'], $targetDir.$dl_front) &&
    move_uploaded_file($_FILES['dl_back']['tmp_name'], $targetDir.$dl_back)
) {
    $stmt = $connect->prepare("SELECT * FROM driving_license WHERE d_id = ?");
    $stmt->bind_param("s", $d_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $update = $connect->prepare("UPDATE driving_license SET 
            dl_number=?, dl_expiry=?, dl_expiry_time=?, dl_front=?, dl_back=?, dl_updated_at=? 
            WHERE d_id=?");
        $update->bind_param("sssssss", $dl_num, $dl_expy, $li_exp_time, $dl_front, $dl_back, $date_update, $d_id);
        $update->execute();
    } else {
        $insert = $connect->prepare("INSERT INTO driving_license 
            (d_id, dl_number, dl_expiry, dl_expiry_time, dl_front, dl_back, dl_created_at)
            VALUES (?, ?, ?, ?, ?, ?, ?)");
        $insert->bind_param("sssssss", $d_id, $dl_num, $dl_expy, $li_exp_time, $dl_front, $dl_back, $date_update);
        $insert->execute();
    }

    echo json_encode([
    'status' => 'success',
    'message' => 'Driver license uploaded successfully.',
    'front_image' => 'img/drivers/driving-license/' . $dl_front,
    'back_image' => 'img/drivers/driving-license/' . $dl_back
]);
} else {
    echo json_encode(['status'=>'error','message'=>'File upload failed.']);
}
?>
