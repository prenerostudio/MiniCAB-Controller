<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

if (isset($_POST['d_id'])) {
    $d_id = $_POST['d_id'];
    $is_num = $_POST['is_num'];
    $date_update = date('Y-m-d H:i:s');
    $targetDir = "../../../img/drivers/vehicle/insurance-schedule/";

    if (!isset($_FILES["sche"]["name"]) || $_FILES["sche"]["error"] != 0) {
        echo json_encode(["status" => "error", "message" => "No file uploaded or upload error."]);
        exit;
    }

    $fileExtension = strtolower(pathinfo($_FILES["sche"]["name"], PATHINFO_EXTENSION));
    $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
    if (!in_array($fileExtension, $allowedExtensions)) {
        echo json_encode(["status" => "error", "message" => "Invalid file type."]);
        exit;
    }

    // Generate unique filename
    $fileName = uniqid('is_', true) . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["sche"]["tmp_name"], $targetFilePath)) {
        $stmt = $connect->prepare("SELECT * FROM `vehicle_ins_schedule` WHERE `d_id` = ?");
        $stmt->bind_param("s", $d_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $updateStmt = $connect->prepare("UPDATE `vehicle_ins_schedule` SET `is_num`=?, `is_img`=?, `is_updated_at`=? WHERE `d_id`=?");
            $updateStmt->bind_param("ssss", $is_num, $fileName, $date_update, $d_id);
            $updateStmt->execute();
        } else {
            $insertStmt = $connect->prepare("INSERT INTO `vehicle_ins_schedule`(`d_id`, `is_num`, `is_img`, `is_created_at`) VALUES (?, ?, ?, ?)");
            $insertStmt->bind_param("ssss", $d_id, $is_num, $fileName, $date_update);
            $insertStmt->execute();
        }

        echo json_encode([
            "status" => "success",
            "message" => "Insurance Schedule uploaded successfully.",
            "is_img" => $fileName
        ]);
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request."]);
}
?>
