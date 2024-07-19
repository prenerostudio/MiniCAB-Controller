<?php
include "config.php";
error_reporting(E_ALL);
ini_set('display_errors', 1);

$selectedInterval = isset($_GET['timeInterval']) ? intval($_GET['timeInterval']) : 0;

if ($selectedInterval <= 0) {
    echo "<tr><td colspan='9'>Invalid time interval selected</td></tr>";
    exit;
}

$query = "SELECT bookings.book_id, bookings.pick_date, bookings.pick_time, bookings.passenger, bookings.pickup, bookings.stops, bookings.destination, bookings.journey_fare, vehicles.v_name, bookings.bid_status 
          FROM bookings 
          INNER JOIN clients ON bookings.c_id = clients.c_id 
          INNER JOIN vehicles ON bookings.v_id = vehicles.v_id 
          INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id 
          WHERE pick_date >= NOW() AND pick_date <= DATE_ADD(NOW(), INTERVAL ? HOUR)";

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
			echo "<td>" . htmlspecialchars($row['postal_code']) . "</td>";
            echo "<td>" . htmlspecialchars($row['pickup']) . "</td>";
            echo "<td>" . htmlspecialchars($row['stops']) . "</td>";
            echo "<td>" . htmlspecialchars($row['destination']) . "</td>";
            echo "<td>" . htmlspecialchars($row['passenger']) . "</td>";
			echo "<td>" . htmlspecialchars($row['journey_type']) . "</td>";
            echo "<td>" . htmlspecialchars($row['journey_fare']) . "</td>";
            echo "<td>" . htmlspecialchars($row['v_name']) . "</td>";
            echo "<td>
                    <form method='post' action='dispatch-process.php'>
                        <input type='hidden' value='" . htmlspecialchars($row['book_id']) . "' name='book_id'>
                        <input type='hidden' value='" . htmlspecialchars($row['c_id']) . "' name='c_id'>
                        <input type='hidden' value='" . htmlspecialchars($row['journey_fare']) . "' name='journey_fare'>
                        <input type='hidden' value='" . htmlspecialchars($row['booking_fee']) . "' name='booking_fee'>
                        <select class='form-control' name='d_id' required>
                            <option value=''>Select Driver</option>";
                            
                            $drsql = mysqli_query($connect, "SELECT drivers.* FROM drivers WHERE drivers.acount_status = 1");
                            while ($drrow = mysqli_fetch_array($drsql)) {
                                echo "<option value='" . htmlspecialchars($drrow['d_id']) . "'>" . htmlspecialchars($drrow['d_id']) . " - " . htmlspecialchars($drrow['d_name']) . " - " . htmlspecialchars($drrow['d_phone']) . "</option>";
                            }
                            
            echo "      </select>
                        <button type='submit' class='btn btn-info'>
                            <i class='ti ti-plane-tilt'></i>
                        </button>
                    </form>
                  </td>";
            echo "</tr>";
        }
    }
    $stmt->close();
} else {
    echo "<tr><td colspan='9'>Error preparing the statement: " . htmlspecialchars($connect->error) . "</td></tr>";
}
$connect->close();
?>
