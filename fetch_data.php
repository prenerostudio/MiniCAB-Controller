<?php
include "config.php";
error_reporting(E_ALL);
ini_set('display_errors', 1);

$selectedInterval = isset($_GET['timeInterval']) ? intval($_GET['timeInterval']) : 0;
if ($selectedInterval <= 0) {
    echo "<tr><td colspan='9'>Invalid time interval selected</td></tr>";
    exit;
}
$query = "SELECT bookings.book_id, bookings.pick_date, bookings.pick_time, bookings.passenger, bookings.pickup, bookings.stops, bookings.destination, bookings.journey_fare, vehicles.v_name, bookings.bid_status FROM bookings INNER JOIN clients ON bookings.c_id = clients.c_id INNER JOIN vehicles ON bookings.v_id = vehicles.v_id INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE pick_date >= DATE_SUB(NOW(), INTERVAL ? HOUR) AND pick_date <= NOW()";
if ($stmt = $connect->prepare($query)) {
    $stmt->bind_param("i", $selectedInterval);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows == 0) {
        echo "<tr><td colspan='9'>No bookings found for the selected interval</td></tr>";
    } else {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['book_id']) . "</td>";
            echo "<td>" . htmlspecialchars($row['pick_date']) . "</td>";
            echo "<td>" . htmlspecialchars($row['pick_time']) . "</td>";
            echo "<td>" . htmlspecialchars($row['passenger']) . "</td>";
            echo "<td>" . htmlspecialchars($row['pickup']) . "</td>";
            echo "<td>" . htmlspecialchars($row['stops']) . "</td>";
            echo "<td>" . htmlspecialchars($row['destination']) . "</td>";
            echo "<td>" . htmlspecialchars($row['journey_fare']) . "</td>";
            echo "<td>" . htmlspecialchars($row['v_name']) . "</td>";
            echo "<td style='width: 15%;'>";
            if ($row['bid_status'] == 0) {
                echo "<a href='open-bid.php?book_id=" . htmlspecialchars($row['book_id']) . "'>
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
            echo "<a href='view-booking.php?book_id=" . htmlspecialchars($row['book_id']) . "'>
                    <button class='btn btn-info'>
                        <i class='ti ti-eye'></i>
                    </button>
                </a>";
            echo "<a href='dispatch-booking.php?book_id=" . htmlspecialchars($row['book_id']) . "'>
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
    }
    $stmt->close();
} else {
    echo "<tr><td colspan='9'>Error preparing the statement: " . htmlspecialchars($connect->error) . "</td></tr>";
}
$connect->close();
?>
