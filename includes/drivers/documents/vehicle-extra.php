<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

$response = ['status' => 'error', 'message' => 'Unexpected error'];

if (!isset($_POST['d_id']) || !isset($_FILES['vextra'])) {
    echo json_encode(['status' => 'error', 'message' => 'Missing data']);
    exit;
}

$d_id = $_POST['d_id'];
$date_update = date('Y-m-d H:i:s');
$targetDir = "../../../img/drivers/vehicle/extra/";
$allowedExtensions = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'webp', 'tiff', 'avif'];

$fileExtension = strtolower(pathinfo($_FILES["vextra"]["name"], PATHINFO_EXTENSION));
if (!in_array($fileExtension, $allowedExtensions)) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid file type']);
    exit;
}

$fileName = uniqid() . "." . $fileExtension;
$targetFilePath = $targetDir . $fileName;

if (move_uploaded_file($_FILES["vextra"]["tmp_name"], $targetFilePath)) {
    try {
        $stmt = $connect->prepare("SELECT * FROM `vehicle_extras` WHERE `d_id` = ?");
        $stmt->bind_param("s", $d_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $updateStmt = $connect->prepare("UPDATE `vehicle_extras` SET `ve_img`=?, `ve_updated_at`=? WHERE `d_id`=?");
            $updateStmt->bind_param("sss", $fileName, $date_update, $d_id);
            $updateStmt->execute();
            logActivity('Driver Extra Document Updated', $d_id, "Driver Extra Document of Driver $d_id updated by Controller.");
        } else {
            $insertStmt = $connect->prepare("INSERT INTO `vehicle_extras`(`d_id`, `ve_img`, `ve_created_at`) VALUES (?, ?, ?)");
            $insertStmt->bind_param("sss", $d_id, $fileName, $date_update);
            $insertStmt->execute();
            logActivity('Driver Extra Document Added', $d_id, "Driver Extra Document of Driver $d_id added by Controller.");
        }

        $response = [
            'status' => 'success',
            'message' => 'Vehicle extra image uploaded successfully!',
            'image' => "img/drivers/vehicle/extra/" . $fileName
        ];

    } catch (Exception $e) {
        $response = ['status' => 'error', 'message' => 'DB error: ' . $e->getMessage()];
    }
} else {
    $response = ['status' => 'error', 'message' => 'File upload failed'];
}

echo json_encode($response);

function logActivity($activityType, $driverId, $details)
{
    global $connect, $myId;
    $userType = 'user';
    $activityStmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $activityStmt->bind_param("ssss", $activityType, $userType, $myId, $details);
    $activityStmt->execute();
}
?>
