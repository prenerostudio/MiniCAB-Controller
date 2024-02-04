<?php
// Include your database connection file
include "config.php";

// Set up error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Sanitize user input for timeInterval
$selectedInterval = isset($_GET['timeInterval']) ? intval($_GET['timeInterval']) : 0;

// Validate selected interval (ensure it's a positive integer or handle other validation logic)
if ($selectedInterval <= 0) {
    // Handle invalid input (e.g., display error message)
    echo "<tr><td colspan='9'>Invalid time interval selected</td></tr>";
    exit; // Stop further execution
}

// Construct SQL query to fetch bookings based on the selected time interval
$bsql = mysqli_query($connect, "SELECT
	jobs.*, 
	booking_type.*, 
	clients.*, 
	drivers.*, 
	vehicles.*, 
	bookings.book_id, 
	bookings.b_type_id, 
	bookings.pickup, 
	bookings.stops, 
	bookings.destination, 
	bookings.address, 
	bookings.postal_code, 
	bookings.passenger, 
	bookings.pick_date, 
	bookings.pick_time, 
	bookings.journey_type, 
	bookings.v_id, 
	bookings.luggage, 
	bookings.child_seat, 
	bookings.flight_number, 
	bookings.delay_time, 
	bookings.note, 
	bookings.booking_status, 
	bookings.bid_status, 
	bookings.bid_note
FROM
	jobs,
	bookings,
	clients,
	drivers,
	booking_type,
	vehicles
WHERE
	jobs.date_job_add >= NOW() - INTERVAL $selectedInterval HOUR AND
	jobs.date_job_add <= NOW() AND
	jobs.job_status = 'Completed' AND
	jobs.book_id = bookings.book_id AND
	jobs.c_id = clients.c_id AND
	jobs.d_id = drivers.d_id AND
	bookings.b_type_id = booking_type.b_type_id AND
	bookings.v_id = vehicles.v_id
");


// Check if query was successful
if (!$bsql) {
    // Handle SQL error (e.g., display error message)
    echo "<tr><td colspan='9'>Error fetching bookings</td></tr>";
    exit; // Stop further execution
}

// Check if any bookings were found
if (mysqli_num_rows($bsql) == 0) {
    // Handle no bookings found (e.g., display message)
    echo "<tr><td colspan='9'>No bookings found for the selected interval</td></tr>";
    exit; // Stop further execution
}

// Generate HTML for the updated table rows based on fetched bookings
while ($brow = mysqli_fetch_array($bsql)) {
    // Output table row HTML based on the fetched data
    echo "<tr>";
    // Add columns as needed
    echo "<td class='sort-id'>" . $brow['job_id'] . "</td>";
    echo "<td class='sort-date'>" . $brow['pick_date'] . "</td>";
    echo "<td class='sort-time'>" . $brow['pick_time'] . "</td>";
    echo "<td class='sort-passenger'>" . $brow['passenger'] . "</td>";
    echo "<td class='sort-pickup' style='width: 15%;'>" . $brow['pickup'] . "</td>";
	echo "<td class='sort-pickup' style='width: 15%;'>" . $brow['stops'] . "</td>";
    echo "<td class='sort-dropoff' style='width: 15%;'>" . $brow['destination'] . "</td>";
    echo "<td class='sort-fare'>" . $brow['journey_fare'] . "</td>";
    echo "<td class='sort-vehicle'>" . $brow['v_name'] . "</td>";
	echo "<td class='sort-vehicle'><button class='btn btn-success'>" . $brow['job_status'] . "</button></td>";
	echo "<td class='sort-vehicle'>" . $brow['d_name'] . "</td>";
    
    // Add other columns
    echo "</tr>";
}
 
// Close the database connection (if necessary)
mysqli_close($connect);
?>
