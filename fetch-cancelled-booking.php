<?php
include "config.php";
error_reporting(E_ALL);
ini_set('display_errors', 1);
$selectedInterval = isset($_GET['timeInterval']) ? intval($_GET['timeInterval']) : 0;
if ($selectedInterval <= 0) {
    echo "<tr><td colspan='12'>Invalid time interval selected</td></tr>";
    exit;
}
$bsql = mysqli_query($connect, "SELECT bookings.*, vehicles.* FROM bookings JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE book_add_date >= NOW() - INTERVAL $selectedInterval HOUR AND book_add_date <= NOW() AND bookings.booking_status = 'Cancelled' ORDER BY bookings.book_id DESC");
if (!$bsql) {
	echo "<tr><td colspan='9'>Error fetching bookings</td></tr>";
	exit; 
}
if (mysqli_num_rows($bsql) == 0) {
	echo "<tr><td colspan='9'>No bookings found for the selected interval</td></tr>";
	exit; 
}
while ($brow = mysqli_fetch_array($bsql)) {
	echo "<tr>";    
    echo "<td>" . $brow['book_id'] . "</td>";
    echo "<td>" . $brow['pick_date'] . "</td>";
    echo "<td>" . $brow['pick_time'] . "</td>";
    echo "<td>" . $brow['postal_code'] . "</td>";
    echo "<td>" . $brow['pickup'] . "</td>";
	echo "<td>" . $brow['stops'] . "</td>";
    echo "<td>" . $brow['destination'] . "</td>";
	echo "<td>" . $brow['passenger'] . "</td>";
	echo "<td>" . $brow['journey_type'] . "</td>";
    echo "<td>" . $brow['journey_fare'] . "</td>";
    echo "<td>" . $brow['v_name'] . "</td>";
    echo "<td>";
    echo "<div class='col-auto status'>							
	<span class='status-dot status-dot-animated bg-red d-block'></span>
	<span>" . $brow['booking_status'] . " </span>											
	</div>";
    echo "</td>";
    echo "</tr>";
}
mysqli_close($connect);
?>
