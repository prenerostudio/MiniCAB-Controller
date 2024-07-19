<?php
include('config.php');

// SQL query to get the number of bookings
$sql = "SELECT COUNT(*) AS booking_count FROM bookings WHERE bookings.booking_status <> 'Booked'";
$result = $connect->query($sql);

$upcoming_booking_count = 0;

if ($result->num_rows > 0) {
    // Fetch the result
    $row = $result->fetch_assoc();
    $upcoming_booking_count  = $row['booking_count'];
}

?>
