<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json');

function uploadImage() {
    $targetDir = "../../img/bookers/";
    if (!isset($_FILES["cpic"]) || $_FILES["cpic"]["error"] !== UPLOAD_ERR_OK) {
        return null;
    }
    $fileExtension = strtolower(pathinfo($_FILES["cpic"]["name"], PATHINFO_EXTENSION));
    $uniqueFilename = uniqid() . '_' . time() . '.' . $fileExtension;
    $targetFilePath = $targetDir . $uniqueFilename;

    $allowTypes = array('jpg','png','jpeg','gif','bmp','pdf','tiff','webp','raw','svg','heif','apng','cr2','ico','jp2','avif');

    if (in_array($fileExtension, $allowTypes) && move_uploaded_file($_FILES["cpic"]["tmp_name"], $targetFilePath)) {
        return $uniqueFilename;
    }
    return null;
}

$cname = $_POST['cname'] ?? '';
$cemail = $_POST['cemail'] ?? '';
$cphone = $_POST['cphone'] ?? '';
$cpass = $_POST['cpass'] ?? '';
$cgender = $_POST['cgender'] ?? '';
$clang = $_POST['clang'] ?? '';
$pc = $_POST['pc'] ?? '';
$cni = $_POST['cni'] ?? '';
$caddress = $_POST['caddress'] ?? '';
$cothers = $_POST['cothers'] ?? '';
$com_type = $_POST['com_type'] ?? '';
$percent = $_POST['percent'] ?? '';
$fixed = $_POST['fixed'] ?? '';
$account_type = 2;

if (!$cname || !$cemail || !$cphone || !$cgender || !$pc) {
    echo json_encode(['status' => 'error', 'message' => 'Please fill in all required fields.']);
    exit();
}

$hashedPassword = password_hash($cpass, PASSWORD_DEFAULT);

// Check phone uniqueness
$stmt_check = $connect->prepare("SELECT COUNT(*) FROM `clients` WHERE `c_phone` = ? AND `account_type` = ?");
$stmt_check->bind_param("ss", $cphone, $account_type);
$stmt_check->execute();
$stmt_check->bind_result($phone_count);
$stmt_check->fetch();
$stmt_check->close();

if ($phone_count > 0) {
    echo json_encode(['status' => 'error', 'message' => 'Phone already exists.']);
    exit();
}

$cpic = uploadImage();

if ($cpic) {
    $sql = "INSERT INTO `clients` (`c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `commission_type`, `percentage`, `fixed`, `account_type`) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("sssssssssssssss", $cname, $cemail, $cphone, $hashedPassword, $caddress, $cgender, $clang, $cpic, $pc, $cothers, $cni, $com_type, $percent, $fixed, $account_type);
} else {
    $sql = "INSERT INTO `clients` (`c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `postal_code`, `others`, `c_ni`, `commission_type`, `percentage`, `fixed`, `account_type`) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("ssssssssssssss", $cname, $cemail, $cphone, $hashedPassword, $caddress, $cgender, $clang, $pc, $cothers, $cni, $com_type, $percent, $fixed, $account_type);
}

if ($stmt->execute()) {
    $activity_type = 'New Booker';
    $user_type = 'user';
    $details = "New Booker $cname added by Controller.";
    mysqli_query($connect, "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES ('$activity_type','$user_type','$myId','$details')");

    echo json_encode(['status' => 'success', 'message' => 'Booker added successfully!']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Failed to add booker. Please try again.']);
}

$stmt->close();
$connect->close();
?>
