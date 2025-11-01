<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

if (!isset($_POST['d_id']) || !isset($_POST['rt_num']) || !isset($_FILES['rt_img'])) {
    echo json_encode(['message' => "Some fields are missing", 'status' => false]);
    exit;
}

$d_id = $_POST['d_id'];
$rt_num = $_POST['rt_num'];
$rt_exp = $_POST['rt_exp']; 
$rt_exp_time = $_POST['rt_exp_time'];
$date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS

$targetDir = "../../../img/drivers/vehicle/road-tax/";
$fileExtension = strtolower(pathinfo($_FILES["rt_img"]["name"], PATHINFO_EXTENSION));
$allowedTypes = ['jpg', 'png', 'jpeg', 'gif'];
$uniqueId = uniqid();
$rt_img = $uniqueId . "." . $fileExtension;
$targetFilePath = $targetDir . $rt_img;

if (!in_array($fileExtension, $allowedTypes)) {
    echo json_encode(['message' => "Invalid file type.", 'status' => false]);
    exit;
}

if (!move_uploaded_file($_FILES["rt_img"]["tmp_name"], $targetFilePath)) {
    echo json_encode(['message' => "File upload failed, please try again.", 'status' => false]);
    exit;
}

// Check if record exists
$fetch = $connect->query("SELECT * FROM `vehicle_road_tax` WHERE `d_id` = '$d_id'");
if ($fetch && $fetch->num_rows > 0) {
    // Update existing record
    $query = "UPDATE `vehicle_road_tax` SET `rt_num`='$rt_num',`rt_exp`='$rt_exp', `rt_exp_time` = '$rt_exp_time', `rt_img`='$rt_img',`rt_updated_at`='$date_update' WHERE `d_id` = '$d_id'";
} else {
    // Insert new record
    $query = "INSERT INTO `vehicle_road_tax`(`d_id`, `rt_num`, `rt_exp`, `rt_exp_time`, `rt_img`, `rt_created_at`) VALUES ('$d_id','$rt_num','$rt_exp', '$rt_exp_time', '$rt_img','$date_update')";
}

if ($connect->query($query)) {
    // Log activity
    $activity_type = "Driver Vehicle Road TAX Document updated";
    $user_type = 'driver';
    $details = "You have updated Vehicle Road TAX Document.";

    $logQuery = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
                 VALUES ('$activity_type', '$user_type', '$d_id', '$details')";
    $connect->query($logQuery);

    echo json_encode(['message' => "Vehicle Road TAX Document Upload Successfully", 'status' => true]);
} else {
    echo json_encode(['message' => "Error in uploading license.", 'status' => false]);
}
?>
