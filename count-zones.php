<?php
include('config.php');


$sql = "SELECT COUNT(*) AS count_zones FROM zones";
$result = $connect->query($sql);

$zone_count = 0;

if ($result->num_rows > 0) {
   
    $row = $result->fetch_assoc();
    $zone_count  = $row['count_zones'];
}

?>
