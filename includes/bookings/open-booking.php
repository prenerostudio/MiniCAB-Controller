<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

$book_id = $_POST['book_id'] ?? '';

if (empty($book_id)) {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid Booking ID'
    ]);
    exit;
}

$status = 'Open';
$date_update = date('Y-m-d H:i:s');

// Update booking status
$sql = "UPDATE bookings SET booking_status=? WHERE book_id=?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("si", $status, $book_id);

if ($stmt->execute()) {

    // Insert into open-bookings
    $sql2 = "INSERT INTO `open-bookings` (book_id, ob_status, ob_created_at) VALUES (?, ?, ?)";
    $stmt2 = $connect->prepare($sql2);
    $stmt2->bind_param("iss", $book_id, $status, $date_update);
    $stmt2->execute();

    // Activity log
    $activity_type = 'Booking Opened';
    $user_type = 'user';
    $details = "Booking ID $book_id Has Been Opened by Controller.";

    $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)";
    $actstmt = $connect->prepare($actsql);
    $actstmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $actstmt->execute();

    echo json_encode([
        'status' => 'success',
        'message' => 'Booking opened successfully.'
    ]);

} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to open booking.'
    ]);
}
?>