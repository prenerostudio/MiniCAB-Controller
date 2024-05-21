<?php
include('config.php');

$query = "SELECT `longitude`, `latitude` FROM `drivers` LIMIT 100";
$result = mysqli_query($connect, $query);
$locations = array();
while ($row = mysqli_fetch_assoc($result)) {
    $locations[] = $row;
}
header('Content-Type: application/json');
echo json_encode($locations);
?>
