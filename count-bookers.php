<?php
include('config.php');

// SQL query to get the number of bookings
$sql = "SELECT COUNT(*) AS count_customers FROM clients WHERE clients.account_type = 2";
$result = $connect->query($sql);

$booker_count = 0;

if ($result->num_rows > 0) {
    // Fetch the result
    $row = $result->fetch_assoc();
    $booker_count  = $row['count_customers'];
}

?>
