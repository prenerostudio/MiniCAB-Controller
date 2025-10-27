<?php
include('../config.php');
$sql = "SELECT COUNT(*) AS count_pob_drivers FROM drivers WHERE status = 'pob'";
$result = $connect->query($sql);
$pob_driver_count = 0;
if ($result->num_rows > 0) {
	$row = $result->fetch_assoc();
	$pob_driver_count  = $row['count_pob_drivers'];
}
?>