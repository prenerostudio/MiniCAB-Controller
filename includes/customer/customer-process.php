<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json');

// ---- IMAGE UPLOAD FUNCTION ----
function uploadImage() {
    if (!isset($_FILES["cpic"]["name"]) || empty($_FILES["cpic"]["name"])) {
        return false;
    }

    $targetDir = "../../img/customers/";
    $fileExtension = strtolower(pathinfo($_FILES["cpic"]["name"], PATHINFO_EXTENSION));
    $uniqueFilename = uniqid() . '_' . time() . '.' . $fileExtension;
    $targetFilePath = $targetDir . $uniqueFilename;
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'bmp', 'webp', 'svg', 'heif', 'apng', 'cr2', 'ico', 'avif');

    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["cpic"]["tmp_name"], $targetFilePath)) {
            return $uniqueFilename;
        }
    }
    return false;
}

// ---- RETRIEVE FORM DATA ----
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
$account_type = 1;

// ---- VALIDATION ----
if (empty($cname) || empty($cemail) || empty($cphone) || empty($cpass) || empty($cgender) || empty($pc)) {
    echo json_encode(["status" => "error", "message" => "Please fill in all required fields."]);
    exit();
}

// ---- CHECK DUPLICATE PHONE ----
$stmt_check = $connect->prepare("SELECT COUNT(*) FROM `clients` WHERE `c_phone` = ?");
$stmt_check->bind_param("s", $cphone);
$stmt_check->execute();
$stmt_check->bind_result($phone_count);
$stmt_check->fetch();
$stmt_check->close();

if ($phone_count > 0) {
    echo json_encode(["status" => "error", "message" => "Phone already exists. Please use a different number."]);
    exit();
}

// ---- HASH PASSWORD ----
$hashedPassword = password_hash($cpass, PASSWORD_DEFAULT);

// ---- UPLOAD IMAGE ----
$cpic = uploadImage();

// ---- INSERT INTO DATABASE ----
if ($cpic !== false) {
    $sql = "INSERT INTO `clients`
        (`c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `account_type`)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("ssssssssssss", $cname, $cemail, $cphone, $hashedPassword, $caddress, $cgender, $clang, $cpic, $pc, $cothers, $cni, $account_type);
} else {
    $sql = "INSERT INTO `clients`
        (`c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `postal_code`, `others`, `c_ni`, `account_type`)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("sssssssssss", $cname, $cemail, $cphone, $hashedPassword, $caddress, $cgender, $clang, $pc, $cothers, $cni, $account_type);
}

// ---- EXECUTE QUERY ----
if ($stmt->execute()) {
    // Log activity
    $activity_type = 'New Customer Added';
    $user_type = 'user';
    $details = "New Customer " . $cname . " has been added by Controller.";
    $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`) 
               VALUES ('$activity_type', '$user_type', '$myId', '$details')";
    mysqli_query($connect, $actsql);

    echo json_encode(["status" => "success", "message" => "Customer has been added successfully."]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to save customer. Please try again."]);
}

$stmt->close();
$connect->close();
exit();
?>
