<?php
ob_start(); // Start output buffering

include('../../configuration.php');
include('../../session.php');

header("Content-Type: application/json");

// Clean any unwanted output from included files
ob_clean();

if (!isset($_POST['v_id'])) {
    echo json_encode(["status"=>"error","message"=>"Vehicle ID missing"]);
    exit;
}

$v_id = mysqli_real_escape_string($connect, $_POST['v_id']);

$fetch = mysqli_query($connect, "SELECT v_img FROM vehicles WHERE v_id='$v_id'");
$data = mysqli_fetch_assoc($fetch);
$oldImage = $data['v_img'] ?? '';

// Delete file if exists
if (!empty($oldImage)) {
    $filePath = "../../img/vehicles/" . $oldImage;
    if (file_exists($filePath)) {
        unlink($filePath);
    }
}

// Update DB
mysqli_query($connect, "UPDATE vehicles SET v_img='' WHERE v_id='$v_id'");

// Final clean JSON output
echo json_encode([
    "status" => "success",
    "message" => "Vehicle image deleted successfully!"
]);

exit;
?>
