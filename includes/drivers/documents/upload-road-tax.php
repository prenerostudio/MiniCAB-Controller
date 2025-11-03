<?php
ob_start();
error_reporting(0);
header('Content-Type: application/json');

include('../../../configuration.php');
include('../../../session.php');

if (isset($_FILES['rt'], $_POST['d_id'])) {

    $d_id = $_POST['d_id'];
    $rt_num = $_POST['rt_num'] ?? '';
    $rt_exp = $_POST['rt_exp'] ?? '';
    $rt_exp_time = $_POST['rt_exp_time'] ?? '';
    $date_update = date('Y-m-d H:i:s');
    $targetDir = "../../../img/drivers/vehicle/road-tax/";

    $fileExtension = strtolower(pathinfo($_FILES["rt"]["name"], PATHINFO_EXTENSION));
    $allowedExtensions = ['jpg','png','jpeg','gif','bmp','pdf','tiff','webp','raw','svg','heif','apng','cr2','ico','jpeg2000','avif'];

    if (!in_array($fileExtension, $allowedExtensions)) {
        echo json_encode(["status" => "error", "message" => "Invalid file type."]);
        exit();
    }

    $fileName = uniqid("roadtax_") . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["rt"]["tmp_name"], $targetFilePath)) {
        try {
            $stmt = $connect->prepare("SELECT * FROM `vehicle_road_tax` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $updateStmt = $connect->prepare("UPDATE `vehicle_road_tax` SET `rt_num`=?,`rt_exp`=?,`rt_exp_time`=?,`rt_img`=?,`rt_updated_at`=? WHERE `d_id`=?");
                $updateStmt->bind_param("ssssss", $rt_num, $rt_exp, $rt_exp_time, $fileName, $date_update, $d_id);
                $updateStmt->execute();
                logActivity('Vehicle Road TAX Updated', $d_id, "Vehicle Road TAX of Driver $d_id has been updated by Controller.");
            } else {
                $insertStmt = $connect->prepare("INSERT INTO `vehicle_road_tax`(`d_id`,`rt_num`,`rt_exp`,`rt_exp_time`,`rt_img`,`rt_created_at`) VALUES (?, ?, ?, ?, ?, ?)");
                $insertStmt->bind_param("ssssss", $d_id, $rt_num, $rt_exp, $rt_exp_time, $fileName, $date_update);
                $insertStmt->execute();
                logActivity('Vehicle Road TAX Added', $d_id, "Vehicle Road TAX of Driver $d_id has been added by Controller.");
            }

            echo json_encode([
                "status" => "success",
                "message" => "Road TAX document uploaded successfully.",
                "rt_img" => $fileName
            ]);
        } catch (Exception $e) {
            echo json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed, please try again."]);
    }

} else {
    echo json_encode(["status" => "error", "message" => "Missing required data."]);
}

function logActivity($activityType, $driverId, $details)
{
    global $connect, $myId;
    $userType = 'user';
    $stmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $activityType, $userType, $myId, $details);
    $stmt->execute();
}
?>
