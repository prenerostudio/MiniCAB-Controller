<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

if (isset($_POST['submit'])) {
    $d_id = $_POST['d_id'] ?? '';
    $mot_num = $_POST['mot_num'] ?? '';
    $mot_exp = $_POST['mot_exp'] ?? '';
    $mot_exp_time = $_POST['mot_exp_time'] ?? '';
    $date_update = date('Y-m-d H:i:s');
    $targetDir = "../../../img/drivers/vehicle/mot-certificate/";

    $allowedExtensions = ['jpg','png','jpeg','gif','bmp','pdf','tiff','webp','raw','svg','heif','apng','cr2','ico','jpeg2000','avif'];

    if (!isset($_FILES["mot"]["name"]) || $_FILES["mot"]["name"] === '') {
        echo json_encode(["status" => "error", "message" => "No file selected for upload."]);
        exit;
    }

    $fileExtension = strtolower(pathinfo($_FILES["mot"]["name"], PATHINFO_EXTENSION));
    if (!in_array($fileExtension, $allowedExtensions)) {
        echo json_encode(["status" => "error", "message" => "Invalid file type."]);
        exit;
    }

    $fileName = uniqid() . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["mot"]["tmp_name"], $targetFilePath)) {
        try {
            $stmt = $connect->prepare("SELECT * FROM `vehicle_mot` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                // Update
                $updateStmt = $connect->prepare("UPDATE `vehicle_mot` SET 
                    `mot_num` = ?, 
                    `mot_expiry` = ?, 
                    `mot_exp_time` = ?, 
                    `mot_img` = ?, 
                    `mot_updated_at` = ? 
                    WHERE `d_id` = ?");
                $updateStmt->bind_param("ssssss", $mot_num, $mot_exp, $mot_exp_time, $fileName, $date_update, $d_id);
                $updateStmt->execute();

                logActivity('Vehicle MOT Certificate Updated', $d_id, "Vehicle MOT Certificate of Driver $d_id has been updated by Controller.");
            } else {
                // Insert
                $insertStmt = $connect->prepare("INSERT INTO `vehicle_mot`
                    (`d_id`, `mot_num`, `mot_expiry`, `mot_exp_time`, `mot_img`, `mot_created_at`) 
                    VALUES (?, ?, ?, ?, ?, ?)");
                $insertStmt->bind_param("ssssss", $d_id, $mot_num, $mot_exp, $mot_exp_time, $fileName, $date_update);
                $insertStmt->execute();

                logActivity('Vehicle MOT Certificate Added', $d_id, "Vehicle MOT Certificate of Driver $d_id has been added by Controller.");
            }

            echo json_encode([
                "status" => "success",
                "message" => "MOT Certificate uploaded successfully.",
                "fileName" => $fileName
            ]);
            exit;
        } catch (Exception $e) {
            echo json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
            exit;
        }
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed, please try again."]);
        exit;
    }
}

function logActivity($activityType, $driverId, $details)
{
    global $connect, $myId;
    $userType = 'user';
    $stmt = $connect->prepare("INSERT INTO `activity_log`
        (`activity_type`, `user_type`, `user_id`, `details`) 
        VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $activityType, $userType, $myId, $details);
    $stmt->execute();
}
?>
