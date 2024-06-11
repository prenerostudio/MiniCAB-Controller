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
$phone = mysqli_real_escape_string($connect, $_POST['phone']);
$email = mysqli_real_escape_string($connect, $_POST['email']);
$message = mysqli_real_escape_string($connect, $_POST['message']);
$date = date("Y-m-d h:i:s");

// Check if c_id exists in the marketing_preference table
$query = "SELECT * FROM marketing_preference WHERE c_id = '$c_id'";
$result = mysqli_query($connect, $query);

if (!$result) {
    http_response_code(500); // Internal Server Error
    echo json_encode(array('message' => 'Error checking c_id existence', 'status' => false));
    exit();
}

if (mysqli_num_rows($result) > 0) {
    // Update existing record
    $sql = "UPDATE `marketing_preference` SET `phone`='$phone', `email`='$email', `message`='$message', `date_added`='$date' WHERE `c_id`='$c_id'";
} else {
    // Insert new record
    $sql = "INSERT INTO `marketing_preference`(`c_id`, `phone`, `email`, `message`, `date_added`) VALUES ('$c_id','$phone','$email','$message','$date')";
}

// Execute the query
if (mysqli_query($connect, $sql)) {
	$activity_type = 'Marketing Preference Updated';				
			$user_type = 'client';				
			$details = "Marketing Preference Updated by booker";				
			$actsql = "INSERT INTO `activity_log`(
										`activity_type`, 
										`user_type`, 
										`user_id`, 
										`details`
										) VALUES (
										'$activity_type',
										'$user_type',
										'$c_id',
										'$details')";
			$actr = mysqli_query($connect, $actsql);
    echo json_encode(array('message' => 'Preferences updated successfully', 'status' => true));
} else {
    http_response_code(500); // Internal Server Error
    echo json_encode(array('message' => 'Error updating preferences', 'status' => false));
}

mysqli_close($connect);
?>
