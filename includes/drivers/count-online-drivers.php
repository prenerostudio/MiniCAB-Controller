<?php
include('../../configuration.php');
$sql = "SELECT COUNT(*) AS count_online_drivers FROM drivers WHERE status = 'online'";
$result = $connect->query($sql);
$online_driver_count = 0;
if ($result->num_rows > 0) {
	$row = $result->fetch_assoc();
	$online_driver_count  = $row['count_online_drivers'];
}
?>