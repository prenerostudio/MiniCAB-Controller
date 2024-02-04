<?php
require 'config.php';

function uploadImage() {
    $targetDir = "img/customers/";
    $fileExtension = strtolower(pathinfo($_FILES["cpic"]["name"], PATHINFO_EXTENSION));
    $uniqueFilename = uniqid() . '_' . time() . '.' . $fileExtension; // Generate unique filename
    $targetFilePath = $targetDir . $uniqueFilename;
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');

    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["cpic"]["tmp_name"], $targetFilePath)) {
            return $uniqueFilename; // Return the unique filename
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
$cni = $_POST['cni'];
$caddress = $_POST['caddress'];
$cothers = $_POST['cothers'];
$account_type = 1;
$date = date("Y-m-d H:i:s");

// Check if the email already exists
$stmt_check = $connect->prepare("SELECT COUNT(*) FROM `clients` WHERE `c_phone` = ?");
$stmt_check->bind_param("s", $cphone);
$stmt_check->execute();
$stmt_check->bind_result($phone_count);
$stmt_check->fetch();
$stmt_check->close();

if ($phone_count > 0) {
     echo '<script>alert("Phone already exists. Please use a different Phone Number.");';
    echo 'window.location.href = "customers.php";</script>';
} else {
    // Handle image upload
    $cpic = uploadImage();

      if ($cpic !== false) {
        // Insert image name along with other data
        $sql = "INSERT INTO `clients`(`c_name`, `c_email`, `c_phone`, `c_password`,  `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `account_type`, `reg_date`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("sssssssssssss", $cname, $cemail, $cphone, $cpass, $caddress, $cgender, $clang, $cpic, $pc, $cothers, $cni, $account_type, $date);
    } else {
        // Insert only name without image name
        $sql = "INSERT INTO `clients`(`c_name`, `c_email`, `c_phone`, `c_password`,  `c_address`, `c_gender`, `c_language`, `postal_code`, `others`, `c_ni`, `account_type`, `reg_date`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("ssssssssssss", $cname, $cemail, $cphone, $cpass, $caddress, $cgender, $clang, $pc, $cothers, $cni, $account_type, $date);
    }

    if ($stmt->execute()) {
        header('Location: customers.php'); // Redirect on successful insertion
        exit();
    } else {
        header('Location: customers.php'); // Handle the error
    }

    $stmt->close();
}

$connect->close();
?>
