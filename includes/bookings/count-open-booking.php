<?php
include('../../configuration.php');


$sql = "SELECT COUNT(*) as open_booking_count FROM `open-bookings`";
$result = $connect->query($sql);

$open_booking_count = 0;

if ($result->num_rows > 0) {
   
    $row = $result->fetch_assoc();
    $open_booking_count = $row['open_booking_count'];
}

?>
