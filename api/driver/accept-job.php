<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = isset($_POST['d_id']) ? $_POST['d_id'] : null;
$job_id = isset($_POST['job_id']) ? $_POST['job_id'] : null;
$status = 'accepted';

if ($d_id && $job_id) {
   
    $stmt = $connect->prepare("UPDATE `jobs` SET `job_status` = ? WHERE `job_id` = ?");
    $stmt->bind_param("si", $status, $job_id);

    if ($stmt->execute()) {
   
        $activity_type = 'Job Accepted';
        $user_type = 'driver';
        $details = "Job $job_id has been accepted by driver.";

   
        $log_stmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
        $log_stmt->bind_param("ssis", $activity_type, $user_type, $d_id, $details);

        if ($log_stmt->execute()) {
            echo json_encode(array('message' => "Driver has accepted job", 'status' => true));
        } else {
            echo json_encode(array('message' => "Error logging activity", 'status' => false));
        }

        $log_stmt->close();
    } else {
        echo json_encode(array('message' => "Error accepting job", 'status' => false));
    }

    $stmt->close();
} else {
    echo json_encode(array('message' => "Some fields are missing", 'status' => false));
}

$connect->close();
?>
