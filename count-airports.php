<?php
include('config.php');

// SQL query to get the number of bookings
$sql = "SELECT COUNT(*) AS count_ap FROM airports";
$result = $connect->query($sql);

$ap_count = 0;

if ($result->num_rows > 0) {
    // Fetch the result
    $row = $result->fetch_assoc();
    $ap_count  = $row['count_ap'];
}

?>
