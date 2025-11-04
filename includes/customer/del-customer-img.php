<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

if (isset($_POST['c_id'])) {
    $c_id = $_POST['c_id'];
    $sql = "UPDATE `clients` SET `c_pic`='' WHERE `c_id`='$c_id'";
    $result = $connect->query($sql);

    if ($result) {
        $activity_type = 'Customer Image Deleted';
        $user_type = 'user';
        $details = "Customer Image has been deleted by Controller.";

        $actsql = "INSERT INTO `activity_log`(
                        `activity_type`, 
                        `user_type`, 
                        `user_id`, 
                        `details`
                    ) VALUES (
                        '$activity_type',
                        '$user_type',
                        '$myId',
                        '$details')";
        mysqli_query($connect, $actsql);

        echo json_encode([
            'status' => 'success',
            'message' => 'Customer image deleted successfully!'
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Database update failed.'
        ]);
    }
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid request.'
    ]);
}
?>
