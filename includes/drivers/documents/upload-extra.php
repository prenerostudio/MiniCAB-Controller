<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

$response = [];

if (isset($_POST['submit'])) {
    $d_id = $_POST['d_id'] ?? '';
    $date_update = date('Y-m-d H:i:s');
    $targetDir = "../../../img/drivers/extra/";
    $allowedExtensions = ['jpg','png','jpeg','gif','bmp','pdf','tiff','webp','raw','svg','heif','apng','cr2','ico','jpeg2000','avif'];

    if (!isset($_FILES["extra"]["name"]) || $_FILES["extra"]["name"] === '') {
        echo json_encode(["status" => "error", "message" => "No file selected for upload."]);
        exit;
    }

    $fileExtension = strtolower(pathinfo($_FILES["extra"]["name"], PATHINFO_EXTENSION));
    if (!in_array($fileExtension, $allowedExtensions)) {
        echo json_encode(["status" => "error", "message" => "Invalid file type."]);
        exit;
    }

    $fileName = uniqid() . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["extra"]["tmp_name"], $targetFilePath)) {
        try {
            $stmt = $connect->prepare("SELECT * FROM `driver_extras` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $updateStmt = $connect->prepare("UPDATE `driver_extras` SET `de_img`= ?, `de_updated_at`= ? WHERE `d_id` = ?");
                $updateStmt->bind_param("sss", $fileName, $date_update, $d_id);
                $updateStmt->execute();

                logActivity('Driver Extra Document Updated', $d_id, "Driver Extra Document of Driver $d_id has been updated by Controller.");
            } else {
                $insertStmt = $connect->prepare("INSERT INTO `driver_extras`(`d_id`, `de_img`, `de_created_at`) VALUES (?, ?, ?)");
                $insertStmt->bind_param("sss", $d_id, $fileName, $date_update);
                $insertStmt->execute();

                logActivity('Driver Extra Document Added', $d_id, "Driver Extra Document of Driver $d_id has been added by Controller.");
            }

            echo json_encode([
                "status" => "success",
                "message" => "Image uploaded successfully.",
                "fileName" => $fileName
            ]);
            exit;
        } catch (Exception $e) {
            echo json_encode(["status" => "error", "message" => "Error: " . $e->getMessage()]);
            exit;
        }
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed, please try again."]);
        exit;
    }
}

// Log activity function
function logActivity($activityType, $driverId, $details)
{
    global $connect, $myId;
    $userType = 'user';
    $activityStmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $activityStmt->bind_param("ssss", $activityType, $userType, $myId, $details);
    $activityStmt->execute();
}
?>
