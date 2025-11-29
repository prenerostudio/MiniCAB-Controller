<?php
include('../../configuration.php');
$sql = "SELECT COUNT(*) AS count_offline_drivers FROM drivers WHERE status = 'offline'";
$result = $connect->query($sql);
$offline_driver_count = 0;
if ($result->num_rows > 0) {
	$row = $result->fetch_assoc();
	$offline_driver_count  = $row['count_offline_drivers'];
}
?>