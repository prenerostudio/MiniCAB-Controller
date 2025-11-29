<?php
include('../../configuration.php');
$sql = "SELECT COUNT(*) AS count_rs FROM railway_stations";
$result = $connect->query($sql);
$rs_count = 0;
if ($result->num_rows > 0) { 
    $row = $result->fetch_assoc();
    $rs_count  = $row['count_rs'];
}
?>