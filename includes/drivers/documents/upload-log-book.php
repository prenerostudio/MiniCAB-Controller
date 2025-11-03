<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

if (isset($_POST['submit'])) {
    $d_id = $_POST['d_id'] ?? '';
    $lb_num = $_POST['lb_num'] ?? '';
    $date_update = date('Y-m-d H:i:s');
    $targetDir = "../../../img/drivers/vehicle/log-book/";

    // Allowed file extensions
    $allowedExtensions = ['jpg','png','jpeg','gif','bmp','pdf','tiff','webp','raw','svg','heif','apng','cr2','ico','jpeg2000','avif'];

    if (!isset($_FILES["log_book"]["name"]) || $_FILES["log_book"]["name"] === '') {
        echo json_encode(["status" => "error", "message" => "No file selected for upload."]);
        exit;
    }

    $fileExtension = strtolower(pathinfo($_FILES["log_book"]["name"], PATHINFO_EXTENSION));
    if (!in_array($fileExtension, $allowedExtensions)) {
        echo json_encode(["status" => "error", "message" => "Invalid file type."]);
        exit;
    }

    $fileName = uniqid() . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["log_book"]["tmp_name"], $targetFilePath)) {
        try {
            // Check if record exists
            $stmt = $connect->prepare("SELECT * FROM `vehicle_log_book` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                // Update
                $updateStmt = $connect->prepare("UPDATE `vehicle_log_book` SET `lb_number`=?, `lb_img`=?, `lb_updated_at`=? WHERE `d_id`=?");
                $updateStmt->bind_param("ssss", $lb_num, $fileName, $date_update, $d_id);
                $updateStmt->execute();

                logActivity('Vehicle Log Book Updated', $d_id, "Vehicle Log Book of Driver $d_id updated by Controller.");
            } else {
                // Insert
                $insertStmt = $connect->prepare("INSERT INTO `vehicle_log_book`(`d_id`, `lb_number`, `lb_img`, `lb_created_at`) VALUES (?, ?, ?, ?)");
                $insertStmt->bind_param("ssss", $d_id, $lb_num, $fileName, $date_update);
                $insertStmt->execute();

                logActivity('Vehicle Log Book Added', $d_id, "Vehicle Log Book of Driver $d_id added by Controller.");
            }

            echo json_encode([
                "status" => "success",
                "message" => "Log Book uploaded successfully.",
                "fileName" => $fileName
            ]);
            exit;
        } catch (Exception $e) {
            echo json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
            exit;
        }
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed."]);
        exit;
    }
}

// Function to log user activity
function logActivity($activityType, $driverId, $details)
{
    global $connect, $myId;
    $userType = 'user';
    $stmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $activityType, $userType, $myId, $details);
    $stmt->execute();
}
?>
