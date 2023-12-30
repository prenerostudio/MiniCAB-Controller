<?php
// Include your database connection file
include "config.php";
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Get the selected time interval from the Ajax request
$selectedInterval = $_GET['timeInterval'];

// Modify your SQL query to fetch data based on the selected time interval
// For example, you can use this value in the WHERE clause of your SQL query
// Ensure to add appropriate validation and security measures
$bsql = mysqli_query($connect, "SELECT * FROM bookings WHERE pick_date >= NOW() AND pick_date <= NOW() + INTERVAL $selectedInterval HOUR");

// Generate HTML for the updated table rows
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
?>
