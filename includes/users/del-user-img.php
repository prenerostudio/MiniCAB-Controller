<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

if (isset($_POST['user_id'])) {
    $user_id = $_POST['user_id'];

    $sql = "UPDATE `users` SET `user_pic`='' WHERE `user_id`=?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param('i', $user_id);
    $result = $stmt->execute();

    if ($result) {
        $activity_type = 'User Profile Image Deleted';
        $user_type = 'user';
        $details = "User Profile Image has been deleted by Controller.";

        $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`) 
                   VALUES (?, ?, ?, ?)";
        $actstmt = $connect->prepare($actsql);
        $actstmt->bind_param('ssis', $activity_type, $user_type, $myId, $details);
        $actstmt->execute();

        echo json_encode(['status' => 'success']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Database update failed.']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request.']);
}
?>
