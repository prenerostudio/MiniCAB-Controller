<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (isset($_POST['d_id'])) {
// Get data from POST request
$book_id = $_POST['book_id'];
$d_id = $_POST['d_id'];
$latitude = $_POST['latitude'];
$longitude = $_POST['longitude'];

// Insert new location record
$sql = "INSERT INTO `driver_routes`(`book_id`, `d_id`, `latitude`, `longitude`) 
        VALUES ('$book_id', '$d_id', '$latitude', '$longitude')";

if ($connect->query($sql) === TRUE) {
    echo "Location saved successfully";
} else {
    echo "Error: " . $connect->error;
}


    } else {
        $response = array('message' => "Some Fields are missing", 'status' => false);
        echo json_encode($response);
    }
} else {
    $response = array('message' => "Invalid Request Method", 'status' => false);
    echo json_encode($response);
}
?>