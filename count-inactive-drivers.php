<?php
include('config.php');
$sql = "SELECT COUNT(*) AS count_inactive_drivers FROM drivers WHERE drivers.acount_status = 2";
$result = $connect->query($sql);
$inactive_driver_count = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $inactive_driver_count  = $row['count_inactive_drivers'];
}
?>