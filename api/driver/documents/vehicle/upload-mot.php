<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../../configuration.php");

if (!isset($_POST['d_id']) || !isset($_POST['mot_num']) || !isset($_FILES['mot_img'])) {
    echo json_encode(['message' => "Some fields are missing", 'status' => false]);
    exit;
}

$d_id = $_POST['d_id'];
$mot_num = $_POST['mot_num'];
$mot_expiry = $_POST['mot_expiry']; 
$mot_exp_time = $_POST['mot_exp_time'];
$date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS

$targetDir = "../../../../img/drivers/vehicle/mot-certificate/";
$fileExtension = strtolower(pathinfo($_FILES["mot_img"]["name"], PATHINFO_EXTENSION));
$allowedTypes = ['jpg', 'png', 'jpeg', 'gif'];
$uniqueId = uniqid();
$mot_img = $uniqueId . "." . $fileExtension;
$targetFilePath = $targetDir . $mot_img;

if (!in_array($fileExtension, $allowedTypes)) {
    echo json_encode(['message' => "Invalid file type.", 'status' => false]);
    exit;
}

if (!move_uploaded_file($_FILES["mot_img"]["tmp_name"], $targetFilePath)) {
    echo json_encode(['message' => "File upload failed, please try again.", 'status' => false]);
    exit;
}

// Check if record exists
$fetch = $connect->query("SELECT * FROM `vehicle_mot` WHERE `d_id` = '$d_id'");
if ($fetch && $fetch->num_rows > 0) {
    // Update existing record
    $query = "UPDATE `vehicle_mot` SET `mot_num`='$mot_num',`mot_expiry`='$mot_expiry', `mot_exp_time`='$mot_exp_time', `mot_img`='$mot_img',`mot_updated_at`='$date_update' WHERE `d_id` = '$d_id'";
} else {
    // Insert new record
    $query = "INSERT INTO `vehicle_mot`(`d_id`, `mot_num`, `mot_expiry`, `mot_exp_time`, `mot_img`, `mot_created_at`) VALUES ('$d_id','$mot_num','$mot_expiry','$mot_exp_time','$mot_img','$date_update')";
}

if ($connect->query($query)) {
    // Log activity
    $activity_type = "Driver Vehicle MOT Certificate Document updated";
    $user_type = 'driver';
    $details = "You have updated Vehicle MOT Certificate Document.";

    $logQuery = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
                 VALUES ('$activity_type', '$user_type', '$d_id', '$details')";
    $connect->query($logQuery);

    echo json_encode(['message' => "Vehicle MOT Certificate Document Upload Successfully", 'status' => true]);
} else {
    echo json_encode(['message' => "Error in uploading license.", 'status' => false]);
}
?>
