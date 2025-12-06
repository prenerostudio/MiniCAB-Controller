<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

$job_id = $_POST['job_id'];
$d_id = $_POST['d_id'];
$journey_fare = $_POST['journey_fare'];
$car_parking = $_POST['car_parking'];
$extra = $_POST['extra'];
$tolls = $_POST['tolls'];
$waiting = $_POST['waiting'];
$fare_status = 'Pending';
$date = date("Y-m-d H:i:s");

if(isset($job_id)){ 
    // Check if fare already exists for the job
    $chksql = "SELECT `fare_id` FROM `fares` WHERE `job_id`='$job_id'";    
    $chkr = mysqli_query($connect, $chksql);    
    if($chkr && mysqli_num_rows($chkr) > 0) {
        $fare_data = mysqli_fetch_assoc($chkr);
        $fare_id = $fare_data['fare_id'];
        // Update fare details
        $sql = "UPDATE `fares` SET `journey_fare`='$journey_fare',`car_parking`='$car_parking',`waiting`='$waiting',`tolls`='$tolls',`extras`='$extra',`fare_status`='$fare_status'  WHERE `fare_id`='$fare_id'";
    } else {
        // Insert new fare record
        $sql = "INSERT INTO `fares` (
                                    `job_id`,
                                    `d_id`, 
                                    `journey_fare`, 
                                    `car_parking`, 
                                    `waiting`, 
                                    `tolls`, 
                                    `extras`, 
                                    `fare_status`, 
                                    `apply_date`
                                    ) VALUES (
                                    '$job_id',
                                    '$d_id',
                                    '$journey_fare',
                                    '$car_parking',
                                    '$waiting',
                                    '$tolls',
                                    '$extra',
                                    '$fare_status',
                                    '$date')";
    }

    $r = mysqli_query($connect, $sql);
    
    if($r){
        // Update jobs table
        $updatejobsql = "UPDATE `jobs` SET 
                            `journey_fare`='$journey_fare',
                            `car_parking`='$car_parking',
                            `waiting`='$waiting',
                            `tolls`='$tolls',
                            `extra`='$extra' 
                         WHERE `job_id`='$job_id'";
        $updatejobr = mysqli_query($connect, $updatejobsql);
        
        if($updatejobr){
            // Fetch book_id from jobs table
            $fetchsql = "SELECT `book_id` FROM `jobs` WHERE `job_id`='$job_id'";
            $fetchr = mysqli_query($connect, $fetchsql);
            
            if($fetchr && mysqli_num_rows($fetchr) > 0) {
                $job_data = mysqli_fetch_assoc($fetchr);
                $book_id = $job_data['book_id'];
                
                // Update bookings table
                $updatesql = "UPDATE `bookings` SET 
                                `journey_fare`='$journey_fare',
                                `car_parking`='$car_parking',
                                `waiting`='$waiting',
                                `tolls`='$tolls',
                                `extra`='$extra' 
                              WHERE `book_id`='$book_id'";
                $updater = mysqli_query($connect, $updatesql);
                
                // Insert activity log
                $activity_type = 'Journey Fare Added';
                $user_type = 'driver';
                $details = "Journey Fare added for correction against job #: $job_id.";
                $actsql = "INSERT INTO `activity_log`(
                                        `activity_type`, 
                                        `user_type`, 
                                        `user_id`, 
                                        `details`
                                        ) VALUES (
                                        '$activity_type',
                                        '$user_type',
                                        '$d_id',
                                        '$details')";        
                $actr = mysqli_query($connect, $actsql);
                
                if ($updater && $actr) {
                    echo json_encode(array('message' => "Fare Details Submitted Successfully", 'status' => true));
                } else {
                    echo json_encode(array('message' => "Error updating booking or logging activity", 'status' => false));
                }
            } else {
                echo json_encode(array('message' => "Error fetching job details", 'status' => false));
            }
        } else {
            echo json_encode(array('message' => "Error updating job details", 'status' => false));
        }
    } else {        
        echo json_encode(array('message' => "Error In Submitting Fare Details", 'status' => false));        
    }    
} else {   
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
