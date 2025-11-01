<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

if (!isset($_POST['d_id']) || !isset($_POST['ra_num']) || !isset($_FILES['ra_img'])) {
    echo json_encode(['message' => "Some fields are missing", 'status' => false]);
    exit;
}

$d_id = $_POST['d_id'];
$ra_num = $_POST['ra_num'];
$ra_exp = $_POST['ra_exp'];
$ra_exp_time = $_POST['ra_exp_time'];

$date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS

$targetDir = "../../../img/drivers/vehicle/rental-agreement/";
$fileExtension = strtolower(pathinfo($_FILES["ra_img"]["name"], PATHINFO_EXTENSION));
$allowedTypes = ['jpg', 'png', 'jpeg', 'gif'];
$uniqueId = uniqid();
$ra_img = $uniqueId . "." . $fileExtension;
$targetFilePath = $targetDir . $ra_img;

if (!in_array($fileExtension, $allowedTypes)) {
    echo json_encode(['message' => "Invalid file type.", 'status' => false]);
    exit;
}

if (!move_uploaded_file($_FILES["ra_img"]["tmp_name"], $targetFilePath)) {
    echo json_encode(['message' => "File upload failed, please try again.", 'status' => false]);
    exit;
}

// Check if record exists
$fetch = $connect->query("SELECT * FROM `rental_agreement` WHERE `d_id` = '$d_id'");
if ($fetch && $fetch->num_rows > 0) {
    // Update existing record
    $query = "UPDATE `rental_agreement` SET `ra_num`='$ra_num',`ra_exp`='$ra_exp', `ra_exp_time`='$ra_exp_time', `ra_img`='$ra_img',`ra_updated_at`='$date_update' WHERE `d_id` = '$d_id'";
} else {
    // Insert new record
    $query = "INSERT INTO `rental_agreement`(`d_id`, `ra_num`, `ra_exp`, `ra_exp_time`, `ra_img`, `ra_created_at`) VALUES ('$d_id','$ra_num','$ra_exp', '$ra_exp_time', '$ra_img','$date_update')";
}

if ($connect->query($query)) {
    // Log activity
    $activity_type = "Driver Vehicle Rental Agreement Document updated";
    $user_type = 'driver';
    $details = "You have updated Vehicle Rental Agreement Document.";

    $logQuery = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
                 VALUES ('$activity_type', '$user_type', '$d_id', '$details')";
    $connect->query($logQuery);

    echo json_encode(['message' => "Vehicle Rental Agreement Document Upload Successfully", 'status' => true]);
} else {
    echo json_encode(['message' => "Error in uploading license.", 'status' => false]);
}
?>
