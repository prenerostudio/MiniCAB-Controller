<?php
include('../../../configuration.php');
include('../../../session.php');
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $d_id = $_POST['d_id'];
    $pl_number = $_POST['pl_number'];
    $pl_exp = $_POST['pl_exp'];
    $pl_exp_time = $_POST['pl_exp_time'];
    $date_update = date('Y-m-d H:i:s');
    $targetDir = "../../../img/drivers/pco-license/";

    $fileExtension = strtolower(pathinfo($_FILES["pco"]["name"], PATHINFO_EXTENSION));
    $allowedExtensions = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    if (!in_array($fileExtension, $allowedExtensions)) {
        echo json_encode(["status" => "error", "message" => "Invalid file type."]);
        exit;
    }

    $fileName = uniqid("pco_") . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["pco"]["tmp_name"], $targetFilePath)) {
        $stmt = $connect->prepare("SELECT * FROM pco_license WHERE d_id = ?");
        $stmt->bind_param("s", $d_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $updateStmt = $connect->prepare("UPDATE pco_license 
                SET pl_number=?, pl_exp=?, pl_exp_time=?, pl_img=?, pl_updated_at=? 
                WHERE d_id=?");
            $updateStmt->bind_param("ssssss", $pl_number, $pl_exp, $pl_exp_time, $fileName, $date_update, $d_id);
            $updateStmt->execute();
        } else {
            $insertStmt = $connect->prepare("INSERT INTO pco_license (d_id, pl_number, pl_exp, pl_exp_time, pl_img, pl_created_at) 
                VALUES (?, ?, ?, ?, ?, ?)");
            $insertStmt->bind_param("ssssss", $d_id, $pl_number, $pl_exp, $pl_exp_time, $fileName, $date_update);
            $insertStmt->execute();
        }

        // Log the activity
        logActivity('PCO License Uploaded', $d_id, "PCO License uploaded for Driver $d_id");

        echo json_encode([
            "status" => "success",
            "message" => "PCO License uploaded successfully.",
            "pco_img" => "img/drivers/pco-license/" . $fileName
        ]);
        exit;
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed."]);
        exit;
    }
}

function logActivity($activityType, $driverId, $details) {
    global $connect, $myId;
    $userType = 'user';
    $activityStmt = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)");
    $activityStmt->bind_param("ssss", $activityType, $userType, $myId, $details);
    $activityStmt->execute();
}
?>
