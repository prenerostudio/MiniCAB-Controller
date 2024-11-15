<?php
include('config.php');
include('session.php');
require 'vendor/autoload.php'; // Load Pusher

$book_id = $_GET['book_id'];
$job_id = $_GET['job_id'];
$status = 'Pending';

// Delete the job
$jsql = "DELETE FROM `jobs` WHERE `job_id`='$job_id'";
$jresult = $connect->query($jsql);

if ($jresult) {
    // Update the booking status
    $bsql = "UPDATE `bookings` SET `booking_status`='$status' WHERE `book_id`='$book_id'";
    $bresult = $connect->query($bsql);

    // Log the activity
    $activity_type = 'Job Withdrawal';
    $user_type = 'user';
    $details = "Job " . $job_id . " has been withdrawn by Controller.";

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
    $actr = mysqli_query($connect, $actsql);

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

    header('location: all-bookings.php');
} else {
    header('location: all-bookings.php');
}

$connect->close();
?>
