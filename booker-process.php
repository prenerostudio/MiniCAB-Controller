<?php
require 'config.php';

// Function to handle image upload
function uploadImage() {
    $targetDir = "img/bookers/";
    $targetFilePath = $targetDir . basename($_FILES["bpic"]["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');

    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["bpic"]["tmp_name"], $targetFilePath)) {
            // Return only the image name
            return basename($targetFilePath);
        } else {
            return false;
        }
    }
    return false;
}

$bname = $_POST['bname'];
$bemail = $_POST['bemail'];
$bphone = $_POST['bphone'];
$bgender = $_POST['bgender'];
$blang = $_POST['blang'];
$pc = $_POST['pc'];
$bcn = $_POST['bcn'];
$bni = $_POST['bni'];
$com_type = $_POST['com_type'];
$percent = $_POST['percent'];
$fixed = $_POST['fixed'];
$baddress = $_POST['baddress'];
$bothers = $_POST['bothers'];
$date = date("Y-m-d H:i:s");

// Check if the email already exists
$stmt_check = $connect->prepare("SELECT COUNT(*) FROM `bookers` WHERE `b_phone` = ?");
$stmt_check->bind_param("s", $bphone);
$stmt_check->execute();
$stmt_check->bind_result($bphone_count);
$stmt_check->fetch();
$stmt_check->close();

if ($bphone_count > 0) {
    // The email already exists, handle the error
    echo 'Phone already exists. Please use a different Phone Number
	.';
} else {
	
    // Handle image upload
    $bpic = uploadImage();

    if ($bpic) {
        $sql = "INSERT INTO `bookers`(`b_name`, `b_email`, `b_phone`, `b_address`, `b_gender`, `b_language`, `b_pic`, `postal_code`, `company_name`, `others`, `b_ni`, `commision_type`, `percent`, `fixed`, `booker_reg_date`)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("sssssssssssssss", $bname, $bemail, $bphone, $baddress, $bgender, $blang, $bpic, $pc, $bcn, $bothers, $bni, $com_type, $percent, $fixed, $date);

        if ($stmt->execute()) {
            // Redirect on successful insertion
            header('Location: Bookers.php');
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
