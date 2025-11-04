<?php
include ('../../configuration.php');

$sql = "SELECT COUNT(*) as fares_count FROM fares WHERE fare_status = 'Pending'";
$result = $connect->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode(['faresCount' => $row['fares_count']]);
} else {
    echo json_encode(['faresCount' => 0]);
}
$connect->close();
?>