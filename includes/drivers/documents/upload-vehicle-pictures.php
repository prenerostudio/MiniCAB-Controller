<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

$response = ["status" => "error", "message" => "Unknown error occurred."];

if (isset($_FILES['pic1'], $_FILES['pic2'], $_POST['d_id'])) {

    $d_id = $_POST['d_id'];
    $date_update = date('Y-m-d H:i:s');
    $targetDir = "../../../img/drivers/vehicle/picture/";

    $allowTypes = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    $fileExtensionFront = strtolower(pathinfo($_FILES["pic1"]["name"], PATHINFO_EXTENSION));
    $fileExtensionBack  = strtolower(pathinfo($_FILES["pic2"]["name"], PATHINFO_EXTENSION));

    if (!in_array($fileExtensionFront, $allowTypes) || !in_array($fileExtensionBack, $allowTypes)) {
        echo json_encode(["status" => "error", "message" => "Invalid file type."]);
        exit();
    }

    $vp_front = uniqid("front_") . "." . $fileExtensionFront;
    $vp_back  = uniqid("back_") . "." . $fileExtensionBack;

    $targetFilePathFront = $targetDir . $vp_front;
    $targetFilePathBack  = $targetDir . $vp_back;

    if (move_uploaded_file($_FILES["pic1"]["tmp_name"], $targetFilePathFront) && move_uploaded_file($_FILES["pic2"]["tmp_name"], $targetFilePathBack)) {
        try {
            $stmt = $connect->prepare("SELECT * FROM `vehicle_pictures` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $updateStmt = $connect->prepare("UPDATE `vehicle_pictures` SET `vp_front`= ?, `vp_back`= ?, `vp_updated_at`= ? WHERE `d_id` = ?");
                $updateStmt->bind_param("ssss", $vp_front, $vp_back, $date_update, $d_id);
                $updateStmt->execute();
                logActivity('Vehicle Pictures Updated', $d_id, "Vehicle pictures updated by Controller.");
            } else {
                $insertStmt = $connect->prepare("INSERT INTO `vehicle_pictures`(`d_id`, `vp_front`, `vp_back`, `vp_created_at`) VALUES (?, ?, ?, ?)");
                $insertStmt->bind_param("ssss", $d_id, $vp_front, $vp_back, $date_update);
                $insertStmt->execute();
                logActivity('Vehicle Pictures Added', $d_id, "Vehicle pictures added by Controller.");
            }

            echo json_encode([
                "status" => "success",
                "message" => "Vehicle images uploaded successfully.",
                "vp_front" => $vp_front,
                "vp_back" => $vp_back
            ]);
        } catch (Exception $e) {
            echo json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Missing required data."]);
}

function logActivity($activityType, $driverId, $details)
{
    global $connect, $myId;
    $userType = 'user';
    $activityStmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $activityStmt->bind_param("ssss", $activityType, $userType, $myId, $details);
    $activityStmt->execute();
}
?>
