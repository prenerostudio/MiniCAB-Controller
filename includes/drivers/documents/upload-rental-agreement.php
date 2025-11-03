<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

if (isset($_POST['d_id'])) {
    $d_id = $_POST['d_id'];
    $ra_num = $_POST['ra_num'];
    $ra_exp = $_POST['ra_exp'];
    $ra_exp_time = $_POST['ra_exp_time'];
    $date_update = date('Y-m-d H:i:s');
    $targetDir = "../../../img/drivers/vehicle/rental-agreement/";

    // Validate file
    if (!isset($_FILES["ra"]["name"]) || $_FILES["ra"]["error"] != 0) {
        echo json_encode(["status" => "error", "message" => "No file uploaded or upload error."]);
        exit;
    }

    $fileExtension = strtolower(pathinfo($_FILES["ra"]["name"], PATHINFO_EXTENSION));
    $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
    if (!in_array($fileExtension, $allowedExtensions)) {
        echo json_encode(["status" => "error", "message" => "Invalid file type."]);
        exit;
    }

    // Generate unique filename
    $fileName = uniqid('ra_', true) . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["ra"]["tmp_name"], $targetFilePath)) {
        $stmt = $connect->prepare("SELECT * FROM `rental_agreement` WHERE `d_id` = ?");
        $stmt->bind_param("s", $d_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $updateStmt = $connect->prepare("UPDATE `rental_agreement` SET `ra_num`=?,`ra_exp`=?,`ra_exp_time`=?,`ra_img`=?,`ra_updated_at`=? WHERE `d_id`=?");
            $updateStmt->bind_param("ssssss", $ra_num, $ra_exp, $ra_exp_time, $fileName, $date_update, $d_id);
            $updateStmt->execute();
        } else {
            $insertStmt = $connect->prepare("INSERT INTO `rental_agreement`(`d_id`, `ra_num`, `ra_exp`, `ra_exp_time`, `ra_img`, `ra_created_at`) VALUES (?, ?, ?, ?, ?, ?)");
            $insertStmt->bind_param("ssssss", $d_id, $ra_num, $ra_exp, $ra_exp_time, $fileName, $date_update);
            $insertStmt->execute();
        }

        echo json_encode([
            "status" => "success",
            "message" => "Rental agreement uploaded successfully.",
            "ra_img" => $fileName
        ]);
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request."]);
}
?>
