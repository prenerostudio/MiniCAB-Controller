<?php
include('config.php');



// Check if user already exists with the provided email
$bemail = $_POST['bemail'];
$checkExistingUserQuery = "SELECT COUNT(*) as count FROM `bookers` WHERE `b_email` = '$bemail'";
$existingUserResult = $connect->query($checkExistingUserQuery);
$row = $existingUserResult->fetch_assoc();
$userExists = $row['count'] > 0;

if ($userExists) {
    // Handle the case where the user already exists
    echo "User with this email already exists. Please choose a different email.";
} else {
    // File Upload Handling
$targetDir = "img/bookers/";
$fileName = basename($_FILES["bpic"]["name"]);
$targetFilePath = $targetDir . $fileName;
$fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
$allowTypes = array('jpg', 'png', 'jpeg', 'gif');

if (in_array($fileType, $allowTypes)) {
    if (move_uploaded_file($_FILES["bpic"]["tmp_name"], $targetFilePath)) {
        $bpic = $fileName;
    } else {
        // Handle file upload failure
        $bpic = null;
    }
} else {
    // Handle invalid file type
    $bpic = null;
}

// Form Data Retrieval
$bname = $_POST['bname'];
$bemail = $_POST['bemail'];
$bphone = $_POST['bphone'];
$bpass = $_POST['bpass'];
$bgender = $_POST['bgender'];
$blang = $_POST['blang'];
$pc = $_POST['pc'];
$bcn = $_POST['bcn'];
$bni = $_POST['bni'];
$others = $_POST['others'];
$baddress = $_POST['baddress'];
$com_percent = $_POST['com_percent'];
$com_fixed = $_POST['com_fixed'];
$date = date("Y-m-d H:i:s");

    // Database Insertion
    $sql = "INSERT INTO `bookers`(
                `b_name`, 
                `b_email`, 
                `b_phone`, 
                `b_password`, 
                `b_address`, 
                `b_gender`, 
                `b_language`, 
                `b_pic`, 
                `postal_code`, 
                `company_name`, 
                `others`, 
                `b_ni`, 
                `com_percentage`, 
                `com_fixed`, 
                `booker_reg_date`
            ) VALUES (
                '$bname',
                '$bemail',
                '$bphone',
                '$bpass',
                '$baddress',
                '$bgender',
                '$blang',
                '$bpic',
                '$pc',
                '$bcn',
                '$others',
                '$bni',
                '$com_percent',
                '$com_fixed',
                '$date')";

    // Execution of SQL Query
    $r = $connect->query($sql);

    // Redirect based on query result
    if ($r) {
        header('Location: bookers.php');
    } else {
        header('Location: clients.php');
    }
}
?>