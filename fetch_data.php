<?php
include "config.php";
error_reporting(E_ALL);
ini_set('display_errors', 1);

$selectedInterval = isset($_GET['timeInterval']) ? intval($_GET['timeInterval']) : 0;
if ($selectedInterval <= 0) {
    echo "<tr><td colspan='9'>Invalid time interval selected</td></tr>";
    exit;
}
$bsql = mysqli_query($connect, "SELECT * FROM bookings INNER JOIN clients ON bookings.c_id = clients.c_id INNER JOIN vehicles ON bookings.v_id = vehicles.v_id INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE pick_date >= DATE_SUB(NOW(), INTERVAL ? HOUR) AND pick_date <= NOW()");
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
    echo "<td class='sort-id'>" . $brow['book_id'] . "</td>";
    echo "<td class='sort-date'>" . $brow['pick_date'] . "</td>";
    echo "<td class='sort-time'>" . $brow['pick_time'] . "</td>";
    echo "<td class='sort-passenger'>" . $brow['passenger'] . "</td>";
    echo "<td class='sort-pickup' style='width: 15%;'>" . $brow['pickup'] . "</td>";
	 echo "<td class='sort-dropoff' style='width: 15%;'>" . $brow['stops'] . "</td>";
    echo "<td class='sort-dropoff' style='width: 15%;'>" . $brow['destination'] . "</td>";
    echo "<td class='sort-fare'>" . $brow['journey_fare'] . "</td>";
    echo "<td class='sort-vehicle'>" . $brow['v_name'] . "</td>";
    echo "<td>";
    if ($brow['bid_status'] == 0) {
        echo "<a href='open-bid.php?book_id=" . $brow['book_id'] . "'>
                <button class='btn btn-instagram'>
                    <i class='ti ti-aspect-ratio'></i>
                </button>
            </a>";
    } else {
        echo "<a href='#'>
                <button class='btn' disabled>
                    <i class='ti ti-aspect-ratio'></i>
                </button>
            </a>";
    }
    echo "<a href='view-booking.php?book_id=" . $brow['book_id'] . "'>
            <button class='btn btn-info'>
                <i class='ti ti-eye'></i>
            </button>
        </a>";
    echo "<a href='dispatch-booking.php?book_id=" . $brow['book_id'] . "'>
            <button class='btn btn-success'>
                <i class='ti ti-plane-tilt'></i>
            </button>
        </a>";
    echo "<button class='btn btn-danger'>
            <i class='ti ti-square-rounded-x'></i>
        </button>";
    echo "</td>";   
    echo "</tr>";
}
mysqli_close($connect);
?>
