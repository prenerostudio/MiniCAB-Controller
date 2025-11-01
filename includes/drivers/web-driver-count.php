<?php
include ('../../config.php');

$recent_time_frame = "7 DAY";
$sql = "SELECT COUNT(*) as web_drivers_count FROM drivers WHERE driver_reg_date >= NOW() - INTERVAL $recent_time_frame AND signup_type = 3";
$result = $connect->query($sql);
if ($result->num_rows > 0) {    
    $row = $result->fetch_assoc();
    echo json_encode(['webDriversCount' => $row['web_drivers_count']]);
} else {
    echo json_encode(['webDriversCount' => 0]);
}
$connect->close();
?>