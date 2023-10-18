<?php
require 'config.php';

// Function to handle image upload
function uploadImage() {
    $targetDir = "img/clients/";
    $targetFilePath = $targetDir . basename($_FILES["cpic"]["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');

    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["cpic"]["tmp_name"], $targetFilePath)) {
            return $targetFilePath;
        } else {
            return false;
        }
    }
    return false;
}

$cname = $_POST['cname'];
$cemail = $_POST['cemail'];
$cphone = $_POST['cphone'];
$cpass = $_POST['cpass'];
$cgender = $_POST['cgender'];
$clang = $_POST['clang'];
$pc = $_POST['pc'];
$ccn = $_POST['ccn'];
$cni = $_POST['cni'];
$caddress = $_POST['caddress'];
$date = date("Y-m-d H:i:s");

// Check if the email already exists
$stmt_check = $connect->prepare("SELECT COUNT(*) FROM `clients` WHERE `c_email` = ?");
$stmt_check->bind_param("s", $cemail);
$stmt_check->execute();
$stmt_check->bind_result($email_count);
$stmt_check->fetch();
$stmt_check->close();

if ($email_count > 0) {
    // The email already exists, handle the error
    echo 'Email already exists. Please use a different email address.';
} else {
    // Email doesn't exist, proceed with insertion
    $cp = password_hash($cpass, PASSWORD_BCRYPT);

    // Handle image upload
    $cpic = uploadImage();

    if ($cpic) {
        $sql = "INSERT INTO `clients` (`c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `company_name`, `c_ni`, `reg_date`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("ssssssssssss", $cname, $cemail, $cphone, $cp, $caddress, $cgender, $clang, $cpic, $pc, $ccn, $cni, $date);

        if ($stmt->execute()) {
            // Redirect on successful insertion
            header('Location: clients.php');
            exit();
        } else {
            // Handle the error
            echo 'Error: ' . $stmt->error;
        }

        $stmt->close();
    } else {
        echo 'Sorry, only JPG, JPEG, PNG, GIF files are allowed for the image.';
    }
}

$connect->close();
?>
