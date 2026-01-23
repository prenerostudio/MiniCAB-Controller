<?php
include('../../configuration.php');
include('../../session.php');
require '../../vendor/autoload.php';

header("Content-Type: application/json");

$book_id = $_POST['book_id'];
$c_id  = $_POST['c_id'];
$d_id = $_POST['d_id'];
$journey_fare = $_POST['journey_fare'];
$booking_fee = $_POST['booking_fee'];
$job_status = 'waiting';

$sql = "INSERT INTO jobs (book_id, c_id, d_id, journey_fare, booking_fee, job_status) VALUES (?, ?, ?, ?, ?, ?)";

$stmt = $connect->prepare($sql);
$stmt->bind_param("iiisss", $book_id, $c_id, $d_id, $journey_fare, $booking_fee, $job_status);

if ($stmt->execute()) {

    $job_id = $stmt->insert_id;

    // Update booking status
    $bstmt = $connect->prepare("UPDATE bookings SET booking_status='Booked' WHERE book_id=?");
    $bstmt->bind_param("i", $book_id);
    $bstmt->execute();

    // Insert history
    $historystmt = $connect->prepare("INSERT INTO driver_history (d_id, book_id) VALUES (?,?)");
    $historystmt->bind_param("ii", $d_id, $book_id);
    $historystmt->execute();

    // Activity log
    $actstmt = $connect->prepare("INSERT INTO activity_log (activity_type,user_type,user_id,details) VALUES ('Job Dispatched','user',?, 'Dispatched by controller')");
    $actstmt->bind_param("i", $myId);
    $actstmt->execute();

    echo json_encode([
        "status" => "success",
        "job_id" => $job_id
    ]);
    exit;

} else {
    echo json_encode([
        "status" => "error",
        "message" => "Database error"
    ]);
    exit;
}
