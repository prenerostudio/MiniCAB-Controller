<?php
include ('config.php');

$recent_time_frame = "7 DAY";


$sql = "SELECT COUNT(*) as new_drivers_count FROM drivers WHERE driver_reg_date >= NOW() - INTERVAL $recent_time_frame AND acount_status = 0";
$result = $connect->query($sql);

if ($result->num_rows > 0) {

    $row = $result->fetch_assoc();
    echo json_encode(['newDriversCount' => $row['new_drivers_count']]);
} else {
    echo json_encode(['newDriversCount' => 0]);
}

$connect->close();
?>
