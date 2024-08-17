<?php
include "config.php";
error_reporting(E_ALL);
ini_set('display_errors', 1);

$selectedInterval = isset($_GET['timeInterval']) ? intval($_GET['timeInterval']) : 0;
if ($selectedInterval <= 0) {
    echo "<tr><td colspan='12' align='center'>Invalid time interval selected</td></tr>";
    exit; 
}
$bsql = mysqli_query($connect, "SELECT jobs.*, booking_type.*, clients.*, drivers.*, vehicles.*, bookings.book_id, bookings.b_type_id, bookings.pickup, bookings.stops, bookings.destination, bookings.address, bookings.postal_code, bookings.passenger, bookings.pick_date, bookings.pick_time, bookings.journey_type, bookings.v_id, bookings.luggage, bookings.child_seat, bookings.flight_number, bookings.delay_time, bookings.note, bookings.booking_status, bookings.bid_status, bookings.bid_note FROM jobs JOIN bookings ON jobs.book_id = bookings.book_id JOIN clients ON jobs.c_id = clients.c_id JOIN drivers ON jobs.d_id = drivers.d_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN vehicles ON bookings.v_id = vehicles.v_id WHERE jobs.date_job_add >= NOW() - INTERVAL $selectedInterval HOUR AND jobs.date_job_add <= NOW() AND jobs.job_status = 'Completed'");
if (!$bsql) {
    echo "<tr><td colspan='12' align='center'>Error fetching bookings</td></tr>";
    exit; 
}
if (mysqli_num_rows($bsql) == 0) {   
    echo "<tr><td colspan='12' align='center'>No bookings found for the selected interval</td></tr>";
    exit; 
}
while ($brow = mysqli_fetch_array($bsql)) {  
    echo "<tr>";
    echo "<td>" . $brow['job_id'] . "</td>";
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
	echo "<td>
	<div class='col-auto status'>
	
	<span class='status-dot status-dot-animated bg-green d-block'></span>

<span>" . $brow['job_status'] . " </span>											
	
	</div>
	
	</td>";
	echo "<td>" . $brow['d_name'] . "</td>";       
    echo "</tr>";
}
mysqli_close($connect);
?>