<?php
ob_clean();
header("Content-Type: application/json; charset=UTF-8");

include('../../configuration.php');
include('../../session.php');

if (!isset($_POST['v_id'])) {
    echo json_encode(["status"=>"error","message"=>"Vehicle ID missing"]);
    exit;
}

$v_id = $_POST['v_id'];

$targetDir = "../../img/vehicles/";
$uniqueName = uniqid() . "_" . basename($_FILES["fileToUpload"]["name"]);
$targetFile = $targetDir . $uniqueName;

$fileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
$allowed = ['jpg','jpeg','png','gif','webp','avif'];

if (!in_array($fileType, $allowed)) {
    echo json_encode(["status"=>"error","message"=>"Invalid file type"]);
    exit;
}

// UPLOAD
if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {

    $sql = "UPDATE vehicles SET v_img='$uniqueName' WHERE v_id='$v_id'";
    mysqli_query($connect, $sql);

    echo json_encode([
        "status" => "success",
        "message" => "Image uploaded successfully!",
        "newImage" => $uniqueName
    ]);
    exit;
}

echo json_encode(["status"=>"error","message"=>"Failed to upload image"]);
exit;
?>
