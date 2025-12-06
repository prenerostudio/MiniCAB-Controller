<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$ob_id = $_POST['ob_id'];
$d_id  = $_POST['d_id'];
$date_update = date('Y-m-d H:i:s');

// Check if the required POST variables are set
if (isset($_POST['ob_id']) && isset($_POST['d_id'])) {
    // Retrieve the current status of the booking
    $status_query = "SELECT ob_status FROM `open-bookings` WHERE `ob_id` = '$ob_id'";
    $status_result = mysqli_query($connect, $status_query);

    if ($status_result && mysqli_num_rows($status_result) > 0) {
        $row = mysqli_fetch_assoc($status_result);
        $current_status = $row['ob_status'];

        // Alternate the status between 'Selected' and 'Open'
        if ($current_status == 'Selected') {
            $status = 'Open';
        } else {
            $status = 'Selected';
        }

        // Update the booking status
        $usql = "UPDATE `open-bookings` SET `d_id` = '$d_id', `ob_status` = '$status', `ob_updated_at` = '$date_update' WHERE `ob_id` = '$ob_id'";
        $ur = mysqli_query($connect, $usql);

        if ($ur) {
            // Log the activity
            $activity_type = 'Booking Status Changed';
            $user_type = 'driver';
            $details = "Booking status has been changed to $status by Driver.";

            $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES ('$activity_type', '$user_type', '$d_id', '$details')";
            $actr = mysqli_query($connect, $actsql);

            echo json_encode(array('message' => 'Booking Status Has Been Changed', 'status' => true));
        } else {
            echo json_encode(array('message' => 'No Record Found', 'status' => false));
        }
    } else {
        echo json_encode(array('message' => 'Booking not found', 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
