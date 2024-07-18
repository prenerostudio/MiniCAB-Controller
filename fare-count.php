<?php
include ('config.php');

// Query to get the count of new drivers with account_status = 0
$sql = "SELECT COUNT(*) as fares_count FROM fares WHERE fare_status = 'Pending'";
$result = $connect->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    $row = $result->fetch_assoc();
    echo json_encode(['faresCount' => $row['fares_count']]);
} else {
    echo json_encode(['faresCount' => 0]);
}

$connect->close();
?>
