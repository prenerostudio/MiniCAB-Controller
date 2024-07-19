<?php
include('config.php');

// SQL query to get the number of bookings
$sql = "SELECT COUNT(*) AS count_des FROM destinations";
$result = $connect->query($sql);

$des_count = 0;

if ($result->num_rows > 0) {
    // Fetch the result
    $row = $result->fetch_assoc();
    $des_count  = $row['count_des'];
}

?>
