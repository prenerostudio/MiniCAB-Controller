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
$bsql = mysqli_query($connect, "SELECT * FROM bookings WHERE book_add_date >= NOW() - INTERVAL $selectedInterval HOUR AND book_add_date <= NOW();");

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
    echo "<td class='sort-id'>" . $brow['book_id'] . "</td>";
    echo "<td class='sort-date'>" . $brow['pick_date'] . "</td>";
    echo "<td class='sort-time'>" . $brow['pick_time'] . "</td>";
    echo "<td class='sort-passenger'>" . $brow['passenger'] . "</td>";
    echo "<td class='sort-pickup' style='width: 15%;'>" . $brow['pickup'] . "</td>";
    echo "<td class='sort-dropoff' style='width: 15%;'>" . $brow['destination'] . "</td>";
    echo "<td class='sort-fare'>" . $brow['journey_fare'] . "</td>";
    echo "<td class='sort-vehicle'>" . $brow['v_name'] . "</td>";
    echo "<td>";

    if ($brow['bid_status'] == 0) {
        echo "<a href='open-bid.php?book_id=" . $brow['book_id'] . "'>
                <button class='btn btn-instagram'>
                    <i class='ti ti-aspect-ratio'></i>Open Bid
                </button>
            </a>";
    } else {
        echo "<a href='#'>
                <button class='btn' disabled>
                    <i class='ti ti-aspect-ratio'></i>on Bid
                </button>
            </a>";
    }

    echo "<a href='view-booking.php?book_id=" . $brow['book_id'] . "'>
            <button class='btn btn-info'>
                <i class='ti ti-eye'></i>View
            </button>
        </a>";

    echo "<a href='dispatch-booking.php?book_id=" . $brow['book_id'] . "'>
            <button class='btn btn-success'>
                <i class='ti ti-plane-tilt'></i>Dispatch
            </button>
        </a>";

    echo "<button class='btn btn-danger'>
            <i class='ti ti-square-rounded-x'></i>Cancel
        </button>";

    echo "</td>";
    // Add other columns
    echo "</tr>";
}

// Close the database connection (if necessary)
mysqli_close($connect);
?>
