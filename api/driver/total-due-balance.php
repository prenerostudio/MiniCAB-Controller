<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

// Include the database configuration file
include("../../config.php");

// Check if c_id is set in the POST request
if(isset($_POST['d_id'])){
    // Sanitize the input to prevent SQL injection
    $d_id = mysqli_real_escape_string($connect, $_POST['d_id']);
    
    // Prepare the SQL query to fetch total commission amount for the given c_id
    $sql = "SELECT d_id, SUM(d_com) AS total_commission FROM driver_accounts WHERE d_id = '$d_id' AND driver_accounts.com_status = 'Unpaid' GROUP BY d_id";

    // Execute the query
    $result = mysqli_query($connect, $sql);

    // Check if there are any rows returned
    if(mysqli_num_rows($result) > 0){
        // Fetch the result as an associative array
        $output = mysqli_fetch_assoc($result);

        // Return the result as JSON with success status and message
        echo json_encode(array('data' => $output, 'status' => true, 'message' => "Total commission fetched successfully"));
    } else {
        // Return a message if no rows are found for the given c_id
        echo json_encode(array('message' => 'No commission found for the given Driver', 'status' => false));
    }
} else {
    // Return a message if c_id is not set in the POST request
    echo json_encode(array('message' => "Driver ID is missing in the request", 'status' => false));
}
?>
