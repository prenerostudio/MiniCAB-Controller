<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type, Authorization, x-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");
require '../../vendor/autoload.php'; // Load Pusher

// Input validation
if (!isset($_POST['book_id'], $_POST['c_id'], $_POST['d_id'], $_POST['journey_fare'])) {
    echo json_encode(['message' => "Required fields are missing", 'status' => false]);
    exit;
}

// Sanitize input
$book_id = (int)$_POST['book_id'];
$c_id = (int)$_POST['c_id'];
$d_id = (int)$_POST['d_id'];
$journey_fare = (float)$_POST['journey_fare'];
$job_status = 'waiting';

// Insert into `jobs` table
$sql = "INSERT INTO `jobs` (`book_id`, `c_id`, `d_id`, `journey_fare`, `job_status`) VALUES (?, ?, ?, ?, ?)";
$stmt = $connect->prepare($sql);
$stmt->bind_param("iiids", $book_id, $c_id, $d_id, $journey_fare, $job_status);

if ($stmt->execute()) {
    $job_id = $stmt->insert_id;

    // Update `bookings` table
    $book_status = 'Booked';
    $bsql = "UPDATE `bookings` SET `booking_status` = ? WHERE `book_id` = ?";
    $bstmt = $connect->prepare($bsql);
    $bstmt->bind_param("si", $book_status, $book_id);
    $bstmt->execute();

    // Insert into `driver_history`
    $historysql = "INSERT INTO `driver_history` (`d_id`, `book_id`) VALUES (?, ?)";
    $historystmt = $connect->prepare($historysql);
    $historystmt->bind_param("ii", $d_id, $book_id);
    $historystmt->execute();

    // Log activity
    $activity_type = 'Job Dispatched';
    $user_type = 'user';
    $details = "Job has been dispatched to driver by Controller.";
    $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";
    $actstmt = $connect->prepare($actsql);
    $actstmt->bind_param("ssis", $activity_type, $user_type, $d_id, $details);
    $actstmt->execute();

    // Fetch details
    $fetchsql = "SELECT jobs.*, bookings.*, clients.*, drivers.*, booking_type.*
                 FROM jobs 
                 JOIN bookings ON jobs.book_id = bookings.book_id 
                 JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id 
                 JOIN clients ON jobs.c_id = clients.c_id 
                 JOIN drivers ON jobs.d_id = drivers.d_id 
                 WHERE jobs.job_id = ? AND jobs.d_id = ?";
    $fetchstmt = $connect->prepare($fetchsql);
    $fetchstmt->bind_param("ii", $job_id, $d_id);
    $fetchstmt->execute();
    $result = $fetchstmt->get_result();
    $output = $result->fetch_all(MYSQLI_ASSOC);

    // Pusher notification
    $options = ['cluster' => 'ap2', 'useTLS' => true];
    $pusher = new Pusher\Pusher('28691ac9c0c5ac41b64a', '9b7a65fedc30abd6a530', '1848550', $options);
    $data = ['message' => 'A new job has been dispatched', 'details' => $output];
    $pusher->trigger('jobs-channel', 'job-dispatched', $data);

    echo json_encode(['message' => 'Booking Has Been Assigned', 'status' => true]);
} else {
    echo json_encode(['message' => 'Failed to dispatch job', 'status' => false, 'error' => $stmt->error]);
}

?>
