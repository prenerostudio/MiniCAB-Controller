<?php
include('config.php');

// Your database connection code here

// Fetch user locations from the database
$query = "SELECT `longitude`, `latitude` FROM `drivers` LIMIT 100";
$result = mysqli_query($connect, $query);

// Prepare data for JSON response
$locations = array();
while ($row = mysqli_fetch_assoc($result)) {
    $locations[] = $row;
}

// Return JSON response
header('Content-Type: application/json');
echo json_encode($locations);
?>
