<?php
include('../../configuration.php');
$sql = "SELECT COUNT(*) AS count_new_drivers FROM drivers WHERE drivers.acount_status = 0";
$result = $connect->query($sql);
$new_driver_count = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $new_driver_count  = $row['count_new_drivers'];
}
?>