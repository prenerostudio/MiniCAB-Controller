<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];

    $sql = "UPDATE `users` SET `user_pic`='' WHERE `user_id`='$user_id'";
    $result = mysqli_query($connect, $sql);

    if ($result) {
        $activity_type = 'User Profile Image Deleted';
        $user_type = 'user';
        $details = "User Profile Image Has Been Deleted by Controller.";

        $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`) 
                   VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        mysqli_query($connect, $actsql);

        echo json_encode(["status" => "success", "message" => "Profile image deleted successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to delete profile image."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request."]);
}
?>
