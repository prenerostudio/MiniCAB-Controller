<?php
require 'config.php';

function uploadImage() {
    $targetDir = "img/customers/";
    $fileExtension = strtolower(pathinfo($_FILES["cpic"]["name"], PATHINFO_EXTENSION));
    $uniqueFilename = uniqid() . '_' . time() . '.' . $fileExtension;
    $targetFilePath = $targetDir . $uniqueFilename;
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    if (in_array($fileExtension, $allowTypes)) {
        if (move_uploaded_file($_FILES["cpic"]["tmp_name"], $targetFilePath)) {
            return $uniqueFilename; 
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
        $sql = "INSERT INTO `clients`(`c_name`, `c_email`, `c_phone`, `c_password`,  `c_address`, `c_gender`, `c_language`, `c_pic`, `postal_code`, `others`, `c_ni`, `account_type`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("ssssssssssss", $cname, $cemail, $cphone, $cpass, $caddress, $cgender, $clang, $cpic, $pc, $cothers, $cni, $account_type);
    } else {
        // Insert only name without image name
        $sql = "INSERT INTO `clients`(`c_name`, `c_email`, `c_phone`, `c_password`,  `c_address`, `c_gender`, `c_language`, `postal_code`, `others`, `c_ni`, `account_type`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("sssssssssss", $cname, $cemail, $cphone, $cpass, $caddress, $cgender, $clang, $pc, $cothers, $cni, $account_type);
    }

    if ($stmt->execute()) {
		$actsql = "INSERT INTO `activity_log` (
												`activity_type`,
												`user`, 
												`details`
												) VALUES (
												'New Customer',
												'$cname',
												'New Customer Added by Controller')";		
		
		
		$actr = mysqli_query($connect, $actsql);		
        header('Location: customers.php'); 
        exit();
    } else {
        header('Location: customers.php'); 
    }
    $stmt->close();
}
$connect->close();
?>