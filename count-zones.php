<?php
include('config.php');

// SQL query to get the number of bookings
$sql = "SELECT COUNT(*) AS count_zones FROM zones";
$result = $connect->query($sql);

$zone_count = 0;

if ($result->num_rows > 0) {
    // Fetch the result
    $row = $result->fetch_assoc();
    $zone_count  = $row['count_zones'];
}

?>
