<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Retrieve POST parameters
$c_id = $_POST['c_id'] ?? '';
$distance = $_POST['distance'] ?? '';
$journey_type = $_POST['journey_type'] ?? '';

// Define per mile price
$per_mile_price = 5;

// Initialize variables
$journey_fare = 0;
$com_amount = 0;

// Calculate journey fare based on journey type
if ($journey_type == 'One Way') {
    $journey_fare = $distance * $per_mile_price;
} elseif ($journey_type == 'Return') {
    $journey_fare = ($distance * $per_mile_price) * 2;
} else {
    $journey_fare = 0;
    $com_amount = 'Error in Counting Fare';
}

// Fetch commission related information from the database
$chksql = "SELECT * FROM `clients` WHERE `c_id`='$c_id'";
$chkr = mysqli_query($connect, $chksql);

if ($chkr && $chk = mysqli_fetch_assoc($chkr)) {
    $com_type = $chk['commission_type'];
    $percentage = $chk['percentage'];
    $fixed = $chk['fixed'];

    if ($com_type == 'fixed') {
        $com_amount = $fixed;
    } else {
        $com_amount = $journey_fare * $percentage / 100;
    }
}

// Prepare response
if ($journey_fare > 0) {
    echo json_encode(array('data' => array('fare' => $journey_fare, 'commission' => $com_amount), 'status' => true));
} else {
    echo json_encode(array('message' => 'No Fare Found', 'status' => false));
}

// Close database connection if necessary
// mysqli_close($connect);
?>
