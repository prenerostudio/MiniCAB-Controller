<?php
include('config.php');

// SQL query to get the number of bookings
$sql = "SELECT COUNT(*) AS count_rs FROM railway_stations";
$result = $connect->query($sql);

$rs_count = 0;

if ($result->num_rows > 0) {
    // Fetch the result
    $row = $result->fetch_assoc();
    $rs_count  = $row['count_rs'];
}

?>
