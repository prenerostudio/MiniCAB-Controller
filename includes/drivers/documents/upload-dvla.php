<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

$response = ['status' => 'error', 'message' => 'Something went wrong'];

if (isset($_POST['d_id']) && isset($_FILES['dvla'])) {
    $d_id = $_POST['d_id'];
    $dvla_num = $_POST['dvla_num'] ?? '';
    $date_update = date('Y-m-d H:i:s');
    $targetDir = "../../../img/drivers/dvla/";

    $fileExtension = strtolower(pathinfo($_FILES["dvla"]["name"], PATHINFO_EXTENSION));
    $allowedExtensions = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'avif'];

    if (!in_array($fileExtension, $allowedExtensions)) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid file type.']);
        exit;
    }

    $fileName = uniqid("dvla_") . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["dvla"]["tmp_name"], $targetFilePath)) {
        try {
            $stmt = $connect->prepare("SELECT * FROM `dvla_check` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $updateStmt = $connect->prepare("UPDATE `dvla_check`
                    SET `dvla_number` = ?, `dvla_img` = ?, `dvla_updated_at` = ?
                    WHERE `d_id` = ?");
                $updateStmt->bind_param("ssss", $dvla_num, $fileName, $date_update, $d_id);
                $updateStmt->execute();
                logActivity('DVLA Check Updated', $d_id, "DVLA Check Number updated for driver $d_id.");
            } else {
                $insertStmt = $connect->prepare("INSERT INTO `dvla_check`
                    (`d_id`, `dvla_number`, `dvla_img`, `dvla_created_at`)
                    VALUES (?, ?, ?, ?)");
                $insertStmt->bind_param("ssss", $d_id, $dvla_num, $fileName, $date_update);
                $insertStmt->execute();
                logActivity('DVLA Check Added', $d_id, "DVLA Check added for driver $d_id.");
            }

            $response = ['status' => 'success', 'message' => 'DVLA uploaded successfully.', 'file' => $fileName];
        } catch (Exception $e) {
            $response = ['status' => 'error', 'message' => $e->getMessage()];
        }
    } else {
        $response = ['status' => 'error', 'message' => 'File upload failed, please try again.'];
    }
}

echo json_encode($response);

function logActivity($activityType, $driverId, $details)
{
    global $connect, $myId;
    $userType = 'user';
    $stmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $activityType, $userType, $myId, $details);
    $stmt->execute();
}
?>
