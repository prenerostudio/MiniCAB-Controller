<?php
include('config.php');


$sql = "SELECT COUNT(*) AS booking_count FROM jobs WHERE jobs.job_status = 'completed'";
$result = $connect->query($sql);

$completed_count = 0;

if ($result->num_rows > 0) {

    $row = $result->fetch_assoc();
    $completed_count  = $row['booking_count'];
}

?>
