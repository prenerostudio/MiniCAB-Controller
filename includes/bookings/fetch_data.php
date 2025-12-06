<?php
include "../../configuration.php";

$selectedInterval = isset($_GET['timeInterval']) ? intval($_GET['timeInterval']) : 0;
if ($selectedInterval <= 0) {
    echo "<tr><td colspan='12' align='center'>Invalid time interval selected</td></tr>";
    exit;
}
$query = "SELECT bookings.*, vehicles.v_name FROM bookings INNER JOIN clients ON bookings.c_id = clients.c_id INNER JOIN vehicles ON bookings.v_id = vehicles.v_id INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE pick_date >= NOW() AND pick_date <= DATE_ADD(NOW(), INTERVAL ? HOUR)";
if ($stmt = $connect->prepare($query)) {
    $stmt->bind_param("i", $selectedInterval);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows == 0) {
        echo "<tr><td colspan='12' align='center'>No bookings found for the selected interval</td></tr>";
    } else {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['book_id']) . "</td>";
            echo "<td>" . htmlspecialchars($row['pick_date']) . "</td>";
            echo "<td>" . htmlspecialchars($row['pick_time']) . "</td>";			
            echo "<td>" . htmlspecialchars($row['postal_code']) . "</td>";
            echo "<td>" . htmlspecialchars($row['pickup']) . "</td>";
            echo "<td>" . htmlspecialchars($row['stops']) . "</td>";
            echo "<td>" . htmlspecialchars($row['destination']) . "</td>";
            echo "<td>" . htmlspecialchars($row['passenger']) . "</td>";			
            echo "<td>" . htmlspecialchars($row['journey_type']) . "</td>";
            echo "<td>" . htmlspecialchars($row['journey_fare']) . "</td>";
            echo "<td>" . htmlspecialchars($row['v_name']) . "</td>";
            echo "<td style='width: 15%;'>";
            if ($row['bid_status'] == 0) {
                echo "<a href='open-bid.php?book_id=" . htmlspecialchars($row['book_id']) . "'>
                        <button class='btn btn-facebook btn-icon' title='Open Bid'>
                            <i class='ti ti-aspect-ratio'></i>
                        </button>
                      </a>";
            } else {
                echo "<a href='#'>
                            <button class='btn btn-icon' disabled>
                                <i class='ti ti-aspect-ratio'></i>
                            </button>
                        </a>";
            }

            echo "<a href='view-booking.php?book_id=" . htmlspecialchars($row['book_id']) . "'>
                    <button class='btn btn-twitter btn-icon' title='View / Edit'>
                        <i class='ti ti-eye'></i>
                    </button>
                </a>";

            if ($row['booking_status'] == 'Booked') {
                echo "<a href='#' >   
                        <button class='btn btn-twitter btn-icon' title='Dispatched' disabled>
                            <i class='ti ti-plane-tilt'></i>
			</button>
                    </a>";
            } else {
                echo "<a href='dispatch-booking.php?book_id=" . htmlspecialchars($row['book_id']) . "'>
			<button class='btn btn-twitter btn-icon'  title='Dispatch'>
                            <i class='ti ti-plane-tilt'></i>
			</button>
                    </a>";
            }

            echo "<a href='cancel-booking.php?book_id=" . htmlspecialchars($row['book_id']) . "'>
			<button class='btn btn-pinterest btn-icon' title='Cancel Booking'>
                            <i class='ti ti-square-rounded-x'></i>
                        </button>
		</a>";
            echo "</td>";
            echo "</tr>";
        }
    }
    $stmt->close();
} else {
    echo "<tr><td colspan='12'>Error preparing the statement: " . htmlspecialchars($connect->error) . "</td></tr>";
}

$connect->close();
?>