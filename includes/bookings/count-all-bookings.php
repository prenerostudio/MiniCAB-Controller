<?php
include('../../configuration.php');
$sql = "SELECT COUNT(*) as booking_count FROM bookings";
$result = $connect->query($sql);
$booking_count = 0;
if ($result->num_rows > 0) {  
    $row = $result->fetch_assoc();
    $booking_count = $row['booking_count'];
}
?>