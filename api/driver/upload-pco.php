<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (!isset($_POST['d_id']) || !isset($_POST['pl_number']) || !isset($_POST['pl_exp']) || !isset($_FILES['pl_img'])) {
    echo json_encode(['message' => "Some fields are missing", 'status' => false]);
    exit;
}

$d_id = $_POST['d_id'];
$pl_number = $_POST['pl_number'];
$pl_exp = $_POST['pl_exp'];
$date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS

$targetDir = "../../img/drivers/pco-license/";
$fileExtension = strtolower(pathinfo($_FILES["pl_img"]["name"], PATHINFO_EXTENSION));
$allowedTypes = ['jpg', 'png', 'jpeg', 'gif'];
$uniqueId = uniqid();
$pco = $uniqueId . "." . $fileExtension;
$targetFilePath = $targetDir . $pco;

if (!in_array($fileExtension, $allowedTypes)) {
    echo json_encode(['message' => "Invalid file type.", 'status' => false]);
    exit;
}

if (!move_uploaded_file($_FILES["pl_img"]["tmp_name"], $targetFilePath)) {
    echo json_encode(['message' => "File upload failed, please try again.", 'status' => false]);
    exit;
}

// Check if record exists
$fetch = $connect->query("SELECT 1 FROM `pco_license` WHERE `d_id` = '$d_id'");
if ($fetch && $fetch->num_rows > 0) {
    // Update existing record
    $query = "UPDATE `pco_license` 
              SET `pl_number` = '$pl_number', 
                  `pl_exp` = '$pl_exp', 
                  `pl_img` = '$pco', 
                  `pl_updated_at` = '$date_update' 
              WHERE `d_id` = '$d_id'";
} else {
    // Insert new record
    $query = "INSERT INTO `pco_license` (`d_id`, `pl_number`, `pl_exp`, `pl_img`, `pl_created_at`) 
              VALUES ('$d_id', '$pl_number', '$pl_exp', '$pco', '$date_update')";
}

if ($connect->query($query)) {
    // Log activity
    $activity_type = "Driver Document updated";
    $user_type = 'driver';
    $details = "You have updated PCO License Document.";

    $logQuery = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
                 VALUES ('$activity_type', '$user_type', '$d_id', '$details')";
    $connect->query($logQuery);

    echo json_encode(['message' => "PCO License Upload Successfully", 'status' => true]);
} else {
    echo json_encode(['message' => "Error in uploading license.", 'status' => false]);
}
?>
