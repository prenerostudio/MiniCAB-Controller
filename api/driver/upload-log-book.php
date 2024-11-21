<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (!isset($_POST['d_id']) || !isset($_POST['lb_number']) || !isset($_FILES['lb_img'])) {
    echo json_encode(['message' => "Some fields are missing", 'status' => false]);
    exit;
}

$d_id = $_POST['d_id'];
 $lb_number = $_POST['lb_number'];
$date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS

$targetDir = "../../img/drivers/vehicle/log-book/";
$fileExtension = strtolower(pathinfo($_FILES["lb_img"]["name"], PATHINFO_EXTENSION));
$allowedTypes = ['jpg', 'png', 'jpeg', 'gif'];
$uniqueId = uniqid();
$lb_img = $uniqueId . "." . $fileExtension;
$targetFilePath = $targetDir . $lb_img;

if (!in_array($fileExtension, $allowedTypes)) {
    echo json_encode(['message' => "Invalid file type.", 'status' => false]);
    exit;
}

if (!move_uploaded_file($_FILES["lb_img"]["tmp_name"], $targetFilePath)) {
    echo json_encode(['message' => "File upload failed, please try again.", 'status' => false]);
    exit;
}

// Check if record exists
$fetch = $connect->query("SELECT * FROM `vehicle_log_book` WHERE `d_id` = '$d_id'");
if ($fetch && $fetch->num_rows > 0) {
    // Update existing record
    $query = "UPDATE `vehicle_log_book` SET `lb_number`='$lb_number',`lb_img`='$lb_img',`lb_updated_at`='$date_update' WHERE `d_id` = '$d_id'";
} else {
    // Insert new record
    $query = "INSERT INTO `vehicle_log_book`(`d_id`, `lb_number`, `lb_img`, `lb_created_at`) VALUES ('$d_id','$lb_number','$lb_img','$date_update')";
}

if ($connect->query($query)) {
    // Log activity
    $activity_type = "Driver Vehicle Log Book Document updated";
    $user_type = 'driver';
    $details = "You have updated Vehicle Log Book Document.";

    $logQuery = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
                 VALUES ('$activity_type', '$user_type', '$d_id', '$details')";
    $connect->query($logQuery);

    echo json_encode(['message' => "Vehicle Log Book Document Upload Successfully", 'status' => true]);
} else {
    echo json_encode(['message' => "Error in uploading license.", 'status' => false]);
}
?>
