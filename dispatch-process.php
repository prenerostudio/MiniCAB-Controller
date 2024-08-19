<?php
include('config.php');
include('session.php');
require 'vendor/autoload.php'; // Load Pusher

session_start();

$book_id = $_POST['book_id'];
$c_id  = $_POST['c_id'];
$d_id = $_POST['d_id'];
$journey_fare = $_POST['journey_fare'];
$booking_fee = $_POST['booking_fee'];
$job_status = 'waiting';

// Prepare and execute the job insertion
$sql = "INSERT INTO `jobs`(
            `book_id`, 
            `c_id`, 
            `d_id`,                
            `journey_fare`, 
            `booking_fee`,                  
            `job_status`
        ) VALUES (?, ?, ?, ?, ?, ?)";

$stmt = $connect->prepare($sql);
$stmt->bind_param("iiisss", $book_id, $c_id, $d_id, $journey_fare, $booking_fee, $job_status);
$result = $stmt->execute();

if ($result) {
	
	$job_id = mysqli_insert_id($connect);
    // Update the booking status
    $book_status = 'Booked';
    $bsql = "UPDATE `bookings` SET `booking_status` = ? WHERE `book_id` = ?";
    $bstmt = $connect->prepare($bsql);
    $bstmt->bind_param("si", $book_status, $book_id);
    $bstmt->execute();

    // Insert into the driver history
    $historysql = "INSERT INTO `driver_history`(`d_id`, `book_id`) VALUES (?, ?)";
    $historystmt = $connect->prepare($historysql);
    $historystmt->bind_param("ii", $d_id, $book_id);
    $historystmt->execute();

    // Log the activity
    $activity_type = 'Job Dispatched';		
    $user_type = 'user';		
    $details = "Job has been dispatched to driver by Controller.";
	
    $actsql = "INSERT INTO `activity_log`(
                                        `activity_type`, 
                                        `user_type`, 
                                        `user_id`, 
                                        `details`
                                        ) VALUES (
                                        ?, ?, ?, ?)";
    $actstmt = $connect->prepare($actsql);
    $actstmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $actstmt->execute();
	
	     // Modify the SQL query to include jobs for today and future jobs
    $fetchsql = "SELECT jobs.*, bookings.*, clients.*, drivers.*, booking_type.* FROM jobs JOIN bookings ON jobs.book_id = bookings.book_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN clients ON jobs.c_id = clients.c_id JOIN drivers ON jobs.d_id = drivers.d_id WHERE jobs.job_id = '$job_id' AND
    jobs.d_id = $d_id";

    $fetchr = mysqli_query($connect, $fetchsql);    
    $output = mysqli_fetch_all($fetchr, MYSQLI_ASSOC);  
	

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
        'message' => 'A new job has been dispatched',
        'details' => $output,
       
    ];

    // Trigger a Pusher event
    $pusher->trigger('jobs-channel', 'job-dispatched', $data);

    header('Location: inprocess-bookings.php');
    exit();
} else {
    header('Location: dashboard.php');
    exit();
}

$connect->close();
?>
