<?php
include('../../configuration.php');
$sql = "SELECT COUNT(*) AS booking_count FROM bookings WHERE booking_status = 'cancelled'";
$result = $connect->query($sql);
$cancel_count = 0;
if ($result->num_rows > 0) {    
    $row = $result->fetch_assoc();
    $cancel_count  = $row['booking_count'];
}
?>