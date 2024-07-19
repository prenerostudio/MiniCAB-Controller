<?php
include('config.php');

// SQL query to get the number of bookings
$sql = "SELECT COUNT(*) AS count_customers FROM clients WHERE clients.account_type = 1";
$result = $connect->query($sql);

$customer_count = 0;

if ($result->num_rows > 0) {
    // Fetch the result
    $row = $result->fetch_assoc();
    $customer_count  = $row['count_customers'];
}

?>
