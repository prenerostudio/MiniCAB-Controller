<?php
include('config.php');
include('session.php');
session_start();

$book_id = $_POST['book_id'];
$c_id  = $_POST['c_id'];
$d_id = $_POST['d_id'];
$job_note = $_POST['job_note'];
$journey_fare = $_POST['journey_fare'];
$booking_fee = $_POST['booking_fee'];
$car_parking = $_POST['car_parking'];
$waiting = $_POST['waiting'];
$tolls = $_POST['tolls'];
$extra = $_POST['extra'];
$job_status = 'waiting';
    
    $sql = "INSERT INTO `jobs`(
                `book_id`, 
                `c_id`, 
                `d_id`, 
                `job_note`, 
                `journey_fare`, 
                `booking_fee`, 
                `car_parking`, 
                `waiting`, 
                `tolls`, 
                `extra`, 
                `job_status`
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("iiissddddds", $book_id, $c_id, $d_id, $job_note, $journey_fare, $booking_fee, $car_parking, $waiting, $tolls, $extra, $job_status);
    $result = $stmt->execute();

    if ($result) {
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
		
		

		$activity_type = 'Job Dispatched';		
		$user_type = 'user';		
		$details = "Job has been dispatched to driver by Controller.";
		
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
        header('Location: upcoming-bookings.php');
        exit();
    } else {
        header('Location: view-booking.php?book_id=' . $book_id);
        exit();
    }


$connect->close();
?>
