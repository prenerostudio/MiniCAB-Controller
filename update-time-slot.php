<?php
include('config.php');
include('session.php');

$ts_id = $_POST['ts_id'];
$ts_date = $_POST['mdate'];
$stime  = $_POST['stime'];
$etime  = $_POST['etime'];
$pph = $_POST['pph'];

$sptime = strtotime($_POST['stime']);
$eptime = strtotime($_POST['etime']);

// Calculate total time in hours and total payment
$total_time = ($eptime - $sptime) / 3600; // Convert seconds to hours
$total_pay = $pph * $total_time;

// Format total pay to 2 decimal places
$total_pay_formatted = number_format($total_pay, 2);

$sql = "UPDATE `time_slots` SET 
							`ts_date`='$ts_date',
							`start_time`='$stime',
							`end_time`='$etime',
							`price_hour`='$pph',
							`total_pay`='$total_pay_formatted' WHERE `ts_id`='$ts_id'";                

$result = mysqli_query($connect, $sql);       

if ($result) {     
    $activity_type = 'Time Slot Update';    
    $user_type = 'user';    
    $details = "Time Slot Has Been Updated by Controller.";
    
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
    
    // Redirect on success
    header('Location: available-time-slots.php');    
    exit();    
} else {    
    // Redirect on failure
    header('Location: available-time-slots.php');    
}

$connect->close();
?>
