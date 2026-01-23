<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json');
function uploadImage() {
    if (empty($_FILES['cpic']['name'])) return null;
    $targetDir = "img/companies/";
    $ext = strtolower(pathinfo($_FILES["cpic"]["name"], PATHINFO_EXTENSION));
    $allowed = ['jpg','jpeg','png','gif','webp','svg','avif'];
    if (!in_array($ext, $allowed)) return false;
    $filename = uniqid() . '.' . $ext;
    $path = $targetDir . $filename;
    return move_uploaded_file($_FILES["cpic"]["tmp_name"], $path) ? $filename : false;
}

// Collect inputs
$cname = $_POST['cname'];
$rpname = $_POST['rpname'];
$cemail = $_POST['cemail'];
$cphone = $_POST['cphone'];
$cpass = password_hash($_POST['cpass'], PASSWORD_DEFAULT);
$cpin  = $_POST['cpin'];
$pc    = $_POST['pc'];
$caddress = $_POST['caddress'];
$acount_status = 0;

// Check phone duplicate
$stmt = $connect->prepare("SELECT COUNT(*) FROM companies WHERE com_phone = ?");
$stmt->bind_param("s", $cphone);
$stmt->execute();
$stmt->bind_result($count);
$stmt->fetch();
$stmt->close();

if ($count > 0) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Phone number already exists'
    ]);
    exit;
}
$cpic = uploadImage();
if ($cpic === false) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid image format'
    ]);
    exit;
}

// Insert company
if ($cpic) {
    $sql = "INSERT INTO companies (com_name, com_email, com_phone, com_password, com_address, com_person, com_pic, postal_code, com_pin, acount_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("sssssssssi", $cname, $cemail, $cphone, $cpass, $caddress, $rpname, $cpic, $pc, $cpin, $acount_status);
} else {
    $sql = "INSERT INTO companies (com_name, com_email, com_phone, com_password, com_address, com_person, postal_code, com_pin, acount_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("ssssssssi", $cname, $cemail, $cphone, $cpass, $caddress, $rpname, $pc, $cpin, $acount_status);
}
if ($stmt->execute()) {
    mysqli_query($connect, "INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES ('New Company Added', 'user', '$myId', 'New Company $cname Added')");
    echo json_encode([
        'status' => 'success',
        'message' => 'Company added successfully'
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Database error'
    ]);
}
?>