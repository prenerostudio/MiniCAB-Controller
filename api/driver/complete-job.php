<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Check if POST data is set
if (isset($_POST['job_id'], $_POST['c_id'], $_POST['d_id'], $_POST['journey_fare'], $_POST['car_parking'], $_POST['waiting'], $_POST['tolls'], $_POST['extra'])) {
    $job_id = $_POST['job_id'];
    $c_id = $_POST['c_id'];
    $d_id = $_POST['d_id'];
    $journey_fare = (float)$_POST['journey_fare'];
    $car_parking = (float)$_POST['car_parking'];
    $waiting = (float)$_POST['waiting'];
    $tolls = (float)$_POST['tolls'];
    $extra = (float)$_POST['extra'];
    $status = 'unpaid';
    $date = date("Y-m-d H:i:s");

    // Prepare statements to prevent SQL injection
    $checkstmt = $connect->prepare("SELECT * FROM `invoice` WHERE `job_id` = ?");
    $checkstmt->bind_param("s", $job_id);
    $checkstmt->execute();
    $result = $checkstmt->get_result();

    if ($result && $result->num_rows > 0) {
        echo json_encode(array('message' => "Invoice Already Created", 'status' => false));
    } else {
        $total_pay = $journey_fare + $car_parking + $waiting + $tolls + $extra;
        $driver_commission = $total_pay * 0.20;

        $insertstmt = $connect->prepare("INSERT INTO `invoice` (
            `job_id`, 
            `c_id`, 
            `d_id`, 
            `journey_fare`, 
            `car_parking`, 
            `waiting`, 
            `tolls`, 
            `extra`, 
            `total_pay`, 
            `driver_commission`, 
            `invoice_status`, 
            `invoice_date`
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $insertstmt->bind_param("sssddddddsss", $job_id, $c_id, $d_id, $journey_fare, $car_parking, $waiting, $tolls, $extra, $total_pay, $driver_commission, $status, $date);

        if ($insertstmt->execute()) {
            $job_status = 'Completed';
            $updatestmt = $connect->prepare("UPDATE `jobs` SET `job_status` = ?, `date_job_add` = ? WHERE `job_id` = ?");
            $updatestmt->bind_param("sss", $job_status, $date, $job_id);
            $updatestmt->execute();

            $fetchstmt = $connect->prepare("SELECT * FROM `jobs` WHERE `job_id` = ?");
            $fetchstmt->bind_param("s", $job_id);
            $fetchstmt->execute();
            $fetchresult = $fetchstmt->get_result();
            $fetchrow = $fetchresult->fetch_assoc();
            $book_id = $fetchrow['book_id'];

            $bookstmt = $connect->prepare("UPDATE `bookings` SET `booking_status` = ? WHERE `book_id` = ?");
            $bookstmt->bind_param("ss", $job_status, $book_id);
            $bookstmt->execute();

            $activity_type = 'Job Completed';
            $user_type = 'driver';
            $details = "Job # $job_id Has been Completed.";

            $activitystmt = $connect->prepare("INSERT INTO `activity_log` (
                `activity_type`, 
                `user_type`, 
                `user_id`, 
                `details`
            ) VALUES (?, ?, ?, ?)");
            $activitystmt->bind_param("ssis", $activity_type, $user_type, $d_id, $details);
            $activitystmt->execute();

            echo json_encode(array('message' => "Invoice Generated Successfully", 'status' => true));
        } else {
            echo json_encode(array('message' => "Error In Generating Invoice", 'status' => false));
        }
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
