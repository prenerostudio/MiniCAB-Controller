<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../../configuration.php");

if (!isset($_POST['d_id']) || !isset($_FILES['de_img'])) {
    echo json_encode(['message' => "Some fields are missing", 'status' => false]);
    exit;
}

$d_id = $_POST['d_id'];

$date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS

$targetDir = "../../../../img/drivers/extra/";
$fileExtension = strtolower(pathinfo($_FILES["de_img"]["name"], PATHINFO_EXTENSION));
$allowedTypes = ['jpg', 'png', 'jpeg', 'gif'];
$uniqueId = uniqid();
$de_img = $uniqueId . "." . $fileExtension;
$targetFilePath = $targetDir . $de_img;

if (!in_array($fileExtension, $allowedTypes)) {
    echo json_encode(['message' => "Invalid file type.", 'status' => false]);
    exit;
}

if (!move_uploaded_file($_FILES["de_img"]["tmp_name"], $targetFilePath)) {
    echo json_encode(['message' => "File upload failed, please try again.", 'status' => false]);
    exit;
}

// Check if record exists
$fetch = $connect->query("SELECT * FROM `driver_extras` WHERE `d_id` = '$d_id'");
if ($fetch && $fetch->num_rows > 0) {
    // Update existing record
    $query = "UPDATE `driver_extras` SET `de_img`='$de_img',`de_updated_at`='$date_update' WHERE `d_id` = '$d_id'";
} else {
    // Insert new record
    $query = "INSERT INTO `driver_extras`(`d_id`, `de_img`, `de_created_at`) VALUES ('$d_id','$de_img','$date_update')";
}

if ($connect->query($query)) {
    // Log activity
    $activity_type = "Driver Extra Document updated";
    $user_type = 'driver';
    $details = "You have updated Extra Document.";

    $logQuery = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
                 VALUES ('$activity_type', '$user_type', '$d_id', '$details')";
    $connect->query($logQuery);

    echo json_encode(['message' => "Extra Document Upload Successfully", 'status' => true]);
} else {
    echo json_encode(['message' => "Error in uploading license.", 'status' => false]);
}
?>
