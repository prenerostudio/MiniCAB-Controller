<?php
include('config.php');

// Perform database connection
//$mysqli = new mysqli($hostname, $username, $password, $database);

// Check connection
//if ($mysqli->connect_error) {
//    die("Connection failed: " . $mysqli->connect_error);
//}

// Fetch user locations from the database
$locations = array();
$result = $connect->query("SELECT `longitude`, `latitude` FROM `drivers`");

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $locations[] = $row;
    }
} else {
    echo "0 results";
}

$connect->close(); // Close the database connection

header('Content-Type: application/json');
echo json_encode($locations); // Send the user locations as JSON response
?>

