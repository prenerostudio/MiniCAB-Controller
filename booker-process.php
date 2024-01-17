<?php
require 'config.php';

function uploadImage() {
    $targetDir = "img/customers/";
    $targetFilePath = $targetDir . basename($_FILES["cpic"]["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');

    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["cpic"]["tmp_name"], $targetFilePath)) {
            return basename($targetFilePath); // Return only the image name
        } else {
            return false;
        }
    }
    return false;
}

$cname = $_POST['cname'];
$cemail = $_POST['cemail'];
$cphone = $_POST['cphone'];
$cgender = $_POST['cgender'];
$clang = $_POST['clang'];
$pc = $_POST['pc'];
$cni = $_POST['cni'];
$caddress = $_POST['caddress'];
$cothers = $_POST['cothers'];
$account_type = 2;
$date = date("Y-m-d H:i:s");

// Check if the email already exists
$stmt_check = $connect->prepare("SELECT COUNT(*) FROM `clients` WHERE `c_email` = ?");
$stmt_check->bind_param("s", $cemail);
$stmt_check->execute();
$stmt_check->bind_result($email_count);
$stmt_check->fetch();
$stmt_check->close();

if ($email_count > 0) {
    echo 'Email already exists. Please use a different email address.';
} else {
    // Handle image upload
    $cpic = uploadImage();

    if ($cpic !== false) {
        // Insert image name along with other data
        $sql = "INSERT INTO `clients`(`c_name`, `c_email`, `c_phone`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `account_type`, `reg_date`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("sssssssssss", $cname, $cemail, $cphone, $caddress, $cgender, $clang, $cpic, $pc, $cothers, $cni, $account_type, $date);
    } else {
        // Insert only name without image name
        $sql = "INSERT INTO `clients`(`c_name`, `c_email`, `c_phone`, `c_address`, `c_gender`, `c_language`, `postal_code`, `others`, `c_ni`, `account_type`, `reg_date`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("ssssssssss", $cname, $cemail, $cphone, $caddress, $cgender, $clang, $pc, $cothers, $cni, $account_type, $date);
    }

    if ($stmt->execute()) {
        header('Location: bookers.php'); // Redirect on successful insertion
        exit();
    } else {
        header('Location: bookers.php'); // Handle the error
    }

    $stmt->close();
}

$connect->close();
?>

