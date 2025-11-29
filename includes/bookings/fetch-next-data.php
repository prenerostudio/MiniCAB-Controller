<?php
include '../../configuration.php';
error_reporting(0);

// GET interval (hours)
$interval = isset($_GET['timeInterval']) ? (int)$_GET['timeInterval'] : 0;

// Current datetime
$currentDateTime = date("Y-m-d H:i:s");

// Future datetime = now + interval hours
$futureDateTime = date("Y-m-d H:i:s", strtotime("+$interval hours"));

// Fetch bookings within interval
$sql = "SELECT
        bookings.*,
        clients.c_name,
        clients.c_email,
        clients.c_phone,
        booking_type.*,
        vehicles.* 
      FROM
        bookings
        LEFT JOIN clients ON bookings.c_id = clients.c_id
        INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id
        LEFT JOIN vehicles ON bookings.v_id = vehicles.v_id 
      WHERE
        CONCAT(bookings.pick_date, ' ', bookings.pick_time) BETWEEN '$currentDateTime' 
        AND '$futureDateTime' 
        AND bookings.booking_status <> 'Booked' 
      ORDER BY
        bookings.book_id DESC";

$result = mysqli_query($connect, $sql);

// If no data
if (mysqli_num_rows($result) == 0) {
    echo "<tr><td colspan='12'>No bookings found.</td></tr>";
    exit;
}

// Generate HTML rows
while ($row = mysqli_fetch_assoc($result)) {

    // time difference for highlight
    $pickup_datetime = strtotime($row['pick_date'] . ' ' . $row['pick_time']);
    $current_datetime = time();
    $time_diff = ($pickup_datetime - $current_datetime) / 60;
    $row_class = ($time_diff <= 10) ? 'near-pickup' : '';

    echo "
    <tr class='$row_class'>
        <td>{$row['book_id']}</td>
        <td>{$row['pick_date']}</td>
        <td>{$row['pick_time']}</td>
        <td>{$row['postal_code']}</td>
        <td>{$row['pickup']}</td>
        <td>{$row['stops']}</td>
        <td>{$row['destination']}</td>
        <td>{$row['passenger']}</td>
        <td>{$row['journey_type']}</td>
        <td>{$row['journey_fare']}</td>
        <td>{$row['v_name']}</td>
        <td style='width:12%;'>
            <form method='post' action='dispatch-process.php'>
                <input type='hidden' name='book_id' value='{$row['book_id']}'>
                <input type='hidden' name='c_id' value='{$row['c_id']}'>
                <input type='hidden' name='journey_fare' value='{$row['journey_fare']}'>
                <input type='hidden' name='booking_fee' value='{$row['booking_fee']}'>
                <div class='mb-3'>
                    <div class='input-group mb-2'>
                        <select class='form-control' name='d_id' required>
                            <option value=''>Select Driver</option>";                            
                            // fetch drivers
                            $drsql = mysqli_query($connect, "SELECT * FROM drivers WHERE acount_status = 1");
                            while ($dr = mysqli_fetch_assoc($drsql)) {
                                echo "
                                <option value='{$dr['d_id']}'>
                                    {$dr['d_id']} - {$dr['d_name']} - {$dr['d_phone']}
                                </option>";
                            }

                        echo "</select>
                        <button class='btn btn-bitbucket' type='submit'>
                            <i class='ti ti-plane-tilt'></i>
                        </button>
                    </div>
                </div>
            </form>
        </td>
    </tr>";
}

?>