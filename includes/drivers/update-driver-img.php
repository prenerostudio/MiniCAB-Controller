<?php
header('Content-Type: application/json');
include('../../configuration.php');
include('../../session.php');

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode(['status' => false, 'message' => 'Invalid request']);
    exit;
}

$d_id = $_POST['d_id'] ?? null;

if (!$d_id || empty($_FILES["fileToUpload"]["name"])) {
    echo json_encode(['status' => false, 'message' => 'Missing driver ID or file']);
    exit;
}

$targetDir = "../../img/drivers/";
$uniqueID = uniqid();
$originalName = basename($_FILES["fileToUpload"]["name"]);
$targetFile = $targetDir . $uniqueID . '_' . $originalName;
$imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
$allowedFileTypes = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'avif'];

if (!in_array($imageFileType, $allowedFileTypes)) {
    echo json_encode(['status' => false, 'message' => 'Invalid file type. Allowed: JPG, JPEG, PNG, GIF, WEBP, AVIF']);
    exit;
}

if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
    $logoName = $uniqueID . '_' . $originalName;

    $stmt = $connect->prepare("UPDATE drivers SET d_pic = ? WHERE d_id = ?");
    $stmt->bind_param("si", $logoName, $d_id);
    $stmt->execute();
    $stmt->close();

    // Log activity
    $activity_type = 'Driver Profile Image Updated';
    $user_type = 'user';
    $details = "Driver Profile Image $d_id has been updated by Controller.";
    $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details)
               VALUES ('$activity_type', '$user_type', '$myId', '$details')";
    mysqli_query($connect, $actsql);

    echo json_encode(['status' => true, 'message' => 'Image uploaded successfully']);
} else {
    echo json_encode(['status' => false, 'message' => 'Error uploading file']);
}
?>
