<?php
include('../../configuration.php');
include('../../session.php');

if (isset($_POST['user_id'])) {
    $user_id = $_POST['user_id'];

    $sql = "DELETE FROM `users` WHERE `user_id` = ?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param('i', $user_id);
    $result = $stmt->execute();

    if ($result) {
        $activity_type = 'Controller Deleted';
        $user_type = 'user';
        $details = "Controller has been deleted by Super Admin.";

        $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`) 
                   VALUES (?, ?, ?, ?)";
        $actstmt = $connect->prepare($actsql);
        $actstmt->bind_param('ssis', $activity_type, $user_type, $myId, $details);
        $actstmt->execute();

        echo 'success';
    } else {
        echo 'error';
    }
}
?>
