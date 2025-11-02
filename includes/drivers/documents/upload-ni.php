<?php
include('../../../configuration.php');
include('../../../session.php');
header('Content-Type: application/json');

$response = ["status" => "error", "message" => "Unknown error"];

if (!isset($_POST['d_id'])) {
    echo json_encode(["status" => "error", "message" => "Missing Driver ID"]);
    exit;
}

$d_id = $_POST['d_id'];
$ni_num = $_POST['ni_num'] ?? '';
$date_update = date('Y-m-d H:i:s');
$targetDir = "../../../img/drivers/ni/";

$file = $_FILES["ni"];
$fileExtension = strtolower(pathinfo($file["name"], PATHINFO_EXTENSION));
$allowed = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'webp', 'svg', 'pdf'];

if (!in_array($fileExtension, $allowed)) {
    echo json_encode(["status" => "error", "message" => "Invalid file type"]);
    exit;
}

$fileName = uniqid("ni_") . "." . $fileExtension;
$targetFilePath = $targetDir . $fileName;

if (move_uploaded_file($file["tmp_name"], $targetFilePath)) {
    $stmt = $connect->prepare("SELECT * FROM national_insurance WHERE d_id = ?");
    $stmt->bind_param("s", $d_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $update = $connect->prepare("UPDATE national_insurance SET ni_number=?, ni_img=?, ni_updated_at=? WHERE d_id=?");
        $update->bind_param("ssss", $ni_num, $fileName, $date_update, $d_id);
        $success = $update->execute();
    } else {
        $insert = $connect->prepare("INSERT INTO national_insurance (d_id, ni_number, ni_img, ni_created_at) VALUES (?, ?, ?, ?)");
        $insert->bind_param("ssss", $d_id, $ni_num, $fileName, $date_update);
        $success = $insert->execute();
    }

    if ($success) {
        $response = [
            "status" => "success",
            "message" => "National Insurance updated successfully!",
            "image" => "img/drivers/ni/" . $fileName
        ];
    } else {
        $response = ["status" => "error", "message" => "Database update failed"];
    }
} else {
    $response = ["status" => "error", "message" => "File upload failed"];
}

echo json_encode($response);
exit;
?>
