<?php
include('../../configuration.php');
include('../../session.php');
header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $c_id = $_POST['c_id'];
    // Get existing image filename
    $query = mysqli_query($connect, "SELECT c_pic FROM clients WHERE c_id='$c_id'");
    $row = mysqli_fetch_assoc($query);
    $oldImage = $row['c_pic'];
    // Delete the file if it exists
    $filePath = "../../img/bookers/" . $oldImage;
    if ($oldImage != '' && file_exists($filePath)) {
        unlink($filePath);
    }
    // Update database
    $sql = "UPDATE clients SET c_pic='' WHERE c_id='$c_id'";
    if (mysqli_query($connect, $sql)) {
        // Log activity
        $activity_type = 'Booker Image Deleted';
        $user_type = 'user';
        $details = "Booker Image has been deleted by Controller.";
        $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details)
                   VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        mysqli_query($connect, $actsql);
        echo json_encode(["status" => "success", "message" => "Booker image deleted successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to delete booker image."]);
    }
}
?>