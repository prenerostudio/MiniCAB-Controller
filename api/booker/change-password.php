<?php

// Set headers for CORS and JSON content type
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: no-cache, no-store, max-age=0, must-revalidate');

// Include configuration file
require_once("../../config.php");


// Sanitize and validate input parameters
$c_id = mysqli_real_escape_string($connect, $_POST['c_id']);
$current_pass = mysqli_real_escape_string($connect, $_POST['current_pass']);
$new_pass = mysqli_real_escape_string($connect, $_POST['new_pass']);

// Fetch client's current password from the database
$query = "SELECT c_password FROM clients WHERE c_id = '$c_id'";
$result = mysqli_query($connect, $query);



$row = mysqli_fetch_assoc($result);
$current_password_hash = $row['c_password'];

// Verify if the current password matches
if ($current_pass !== $current_password_hash) {
    http_response_code(401); // Unauthorized
    echo json_encode(array('message' => 'Current password is incorrect', 'status' => false));
    exit();
}


// Hash the new password
//$new_password_hash = password_hash($new_pass, PASSWORD_DEFAULT);

// Update the password in the database
$sql = "UPDATE `clients` SET `c_password`='$new_pass', `reg_date`=NOW() WHERE `c_id`='$c_id'";

if (mysqli_query($connect, $sql)) {
    echo json_encode(array('message' => 'Password updated successfully', 'status' => true));
} else {
    http_response_code(500); // Internal Server Error
    echo json_encode(array('message' => 'Error updating password', 'status' => false));
}

mysqli_close($connect);
?>
