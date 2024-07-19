<?php
include('config.php');

// SQL query to get the number of bookings
$sql = "SELECT COUNT(*) AS count_active_drivers FROM drivers WHERE drivers.acount_status = 1";
$result = $connect->query($sql);

$active_driver_count = 0;

if ($result->num_rows > 0) {
    // Fetch the result
    $row = $result->fetch_assoc();
    $active_driver_count  = $row['count_active_drivers'];
}

?>
