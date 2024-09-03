<?php
require 'config.php';
include('session.php');

function uploadImage() {
    $targetDir = "img/drivers/";
    $targetFilePath = $targetDir . uniqid() . '_' . basename($_FILES["dpic"]["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));

    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg 2000', 'avif');


    if (in_array($fileType, $allowTypes)) {

        $check = getimagesize($_FILES["dpic"]["tmp_name"]);
        if ($check !== false) {
            if (move_uploaded_file($_FILES["dpic"]["tmp_name"], $targetFilePath)) {
                return $targetFilePath;
            } else {
                return false; 
            }
        } else {
            return false; 
        }
    }
    return false; 
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $dname = $_POST['dname'];
    $demail = $_POST['demail'];
    $dphone = $_POST['dphone'];
    $dpass = $_POST['dpass'];
    $dauth = $_POST['dauth'];
    $dlang = $_POST['dlang'];
    $dgender = $_POST['dgender'];
    $address = $_POST['address'];
    $post_code = $_POST['post_code'];
    $status = 0;


    $hashed_password = password_hash($dpass, PASSWORD_DEFAULT);

    $stmt_check = $connect->prepare("SELECT COUNT(*) FROM `drivers` WHERE `d_phone` = ?");
    $stmt_check->bind_param("s", $dphone);
    $stmt_check->execute();
    $stmt_check->bind_result($phone_count);
    $stmt_check->fetch();
    $stmt_check->close();

    if ($phone_count > 0) {
        echo 'User already exists. Please use a different Phone Number.';
        exit;
    } else {
        $dpic = uploadImage();
        if ($dpic) {
            $sql = "INSERT INTO `drivers`(`d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_pic`, `d_gender`, `d_language`, `licence_authority`, `acount_status`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $connect->prepare($sql);
            $stmt->bind_param("ssssssssssi", $dname, $demail, $dphone, $hashed_password, $address, $post_code, $dpic, $dgender, $dlang, $dauth, $status);
        } else {
            $sql = "INSERT INTO `drivers`(`d_name`, `d_email`, `d_phone`, `d_password`, `d_address`, `d_post_code`, `d_gender`, `d_language`, `licence_authority`, `acount_status`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $connect->prepare($sql);
            $stmt->bind_param("sssssssssi", $dname, $demail, $dphone, $hashed_password, $address, $post_code, $dgender, $dlang, $dauth, $status);
        }

        if ($stmt->execute()) {
            $d_id = $stmt->insert_id;
            $stmt->close();

            $dsql = "INSERT INTO `driver_documents`(`d_id`) VALUES (?)";
            $dr = $connect->prepare($dsql);
            $dr->bind_param("i", $d_id);
            $dr->execute();
            $dr->close();

            $vsql = "INSERT INTO `vehicle_documents`(`d_id`) VALUES (?)";
            $vr = $connect->prepare($vsql);
            $vr->bind_param("i", $d_id);
            $vr->execute();
            $vr->close();
       
            $activity_type = 'New Driver Added';
            $user_type = 'user';
            $details = "New Driver $dname Has been Added by Controller.";

            $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";
            $actr = $connect->prepare($actsql);
            $actr->bind_param("ssis", $activity_type, $user_type, $d_id, $details);
            $actr->execute();
            $actr->close();
            header('Location: new-drivers.php');
            exit();
        } else {
            echo 'Failed to add new driver.';
            exit();
        }
    }
} else {
    echo 'Form submission method not allowed.';
    exit();
}
$connect->close();
?>
