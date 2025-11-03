<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

$response = ['status' => false, 'message' => 'Unknown error'];

if (isset($_POST['d_id'])) {
    $d_id = $_POST['d_id'];
    $vpco_num = $_POST['vpco_num'] ?? '';
    $vpco_exp = $_POST['vpco_exp'] ?? '';
    $vpco_exp_time = $_POST['vpco_exp_time'] ?? '';
    $date_update = date('Y-m-d H:i:s'); 
    $targetDir = "../../../img/drivers/vehicle/pco/";

    $file = $_FILES['vpco'];
    $fileExtension = strtolower(pathinfo($file["name"], PATHINFO_EXTENSION));
    $allowedExtensions = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    if (!in_array($fileExtension, $allowedExtensions)) {
        echo json_encode(['status' => false, 'message' => 'Invalid file type.']);
        exit;
    }

    $fileName = uniqid() . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($file["tmp_name"], $targetFilePath)) {
        $stmt = $connect->prepare("SELECT * FROM `vehicle_pco` WHERE `d_id` = ?");
        $stmt->bind_param("s", $d_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $updateStmt = $connect->prepare("UPDATE `vehicle_pco` SET `vpco_num`=?, `vpco_exp`=?, `vpco_exp_time`=?, `vpco_img`=?, `vpco_updated_at`=? WHERE `d_id`=?");
            $updateStmt->bind_param("ssssss", $vpco_num, $vpco_exp, $vpco_exp_time, $fileName, $date_update, $d_id);
            $updateStmt->execute();
            logActivity('Vehicle PCO Updated', $d_id, "Vehicle PCO of Driver $d_id has been updated by Controller.");
            $response = ['status' => true, 'message' => 'Vehicle PCO updated successfully', 'image' => $fileName];
        } else {
            $insertStmt = $connect->prepare("INSERT INTO `vehicle_pco`(`d_id`, `vpco_num`, `vpco_exp`, `vpco_exp_time`, `vpco_img`, `vpco_created_at`) VALUES (?, ?, ?, ?, ?, ?)");
            $insertStmt->bind_param("ssssss", $d_id, $vpco_num, $vpco_exp, $vpco_exp_time, $fileName, $date_update);
            $insertStmt->execute();
            logActivity('Vehicle PCO Added', $d_id, "Vehicle PCO of Driver $d_id has been added by Controller.");
            $response = ['status' => true, 'message' => 'Vehicle PCO added successfully', 'image' => $fileName];
        }
    } else {
        $response = ['status' => false, 'message' => 'File upload failed, please try again.'];
    }
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
