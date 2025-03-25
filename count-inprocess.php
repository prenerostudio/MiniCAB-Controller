<?php
include('config.php');
$sql = "SELECT COUNT(*) AS booking_count FROM jobs WHERE jobs.job_status <> 'Completed' AND jobs.job_status <> 'Cancelled'";
$result = $connect->query($sql);
$inprocess_count = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $inprocess_count  = $row['booking_count'];
}
?>