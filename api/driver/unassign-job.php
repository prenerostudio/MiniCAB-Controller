<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type, Authorization, x-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");
require '../../vendor/autoload.php'; // Load Pusher

// Input validation
if (!isset($_POST['book_id'], $_POST['job_id'])) {
    echo json_encode(['message' => "Required fields are missing", 'status' => false]);
    exit;
}

$book_id = $_POST['book_id'];
$job_id = $_POST['job_id'];
$status = 'Pending';

try {
    // Delete the job
    $jsql = "DELETE FROM `jobs` WHERE `job_id` = ?";
    $jstmt = $connect->prepare($jsql);
    $jstmt->bind_param("i", $job_id);

    if (!$jstmt->execute()) {
        throw new Exception("Failed to delete job: " . $jstmt->error);
    }

    // Update the booking status
    $bsql = "UPDATE `bookings` SET `booking_status` = ? WHERE `book_id` = ?";
    $bstmt = $connect->prepare($bsql);
    $bstmt->bind_param("si", $status, $book_id);

    if (!$bstmt->execute()) {
        throw new Exception("Failed to update booking status: " . $bstmt->error);
    }

    // Log activity
    $activity_type = 'Job Withdrawn';
    $user_type = 'user';
    $details = "Job $job_id has been withdrawn by Controller.";
    $user_id = 0; // Replace with the actual user ID if available

    $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";
    $actstmt = $connect->prepare($actsql);
    $actstmt->bind_param("ssis", $activity_type, $user_type, $user_id, $details);

    if (!$actstmt->execute()) {
        throw new Exception("Failed to log activity: " . $actstmt->error);
    }

    // Initialize Pusher
    $options = [
        'cluster' => 'ap2',
        'useTLS' => true
    ];
    $pusher = new Pusher\Pusher(
        '28691ac9c0c5ac41b64a',
        '9b7a65fedc30abd6a530',
        '1848550',
        $options
    );

    // Data to send via Pusher
    $data = [
        'message' => "Job $job_id has been withdrawn.",
        'job_id' => $job_id,
        'book_id' => $book_id
    ];

    // Trigger the event on 'jobs-channel'
    $pusher->trigger('jobs-channel', 'job-withdrawn', $data);

    echo json_encode(['message' => 'Booking Has Been Withdrawn', 'status' => true]);
} catch (Exception $e) {
    echo json_encode(['message' => 'An error occurred', 'status' => false, 'error' => $e->getMessage()]);
}
?>
