<?php
include('config.php'); // Include your database connection file

// Get the client ID and booking type ID from the AJAX request
$c_id = isset($_POST['c_id']) ? intval($_POST['c_id']) : 0;
$b_type_id = isset($_POST['b_type_id']) ? intval($_POST['b_type_id']) : 0;

// Prepare the SQL query to fetch customer details
$query = "SELECT c_phone, c_email FROM clients WHERE c_id = ? AND b_type_id = ?";
$stmt = $connect->prepare($query);
$stmt->bind_param('ii', $c_id, $b_type_id);
$stmt->execute();
$result = $stmt->get_result();

// Prepare the response
$response = array();
if ($row = $result->fetch_assoc()) {
    $response['phone'] = $row['c_phone'];
    $response['email'] = $row['c_email'];
} else {
    $response['error'] = 'Client not found';
}

// Output the response as JSON
echo json_encode($response);

// Close the statement and connection
$stmt->close();
$connect->close();
?>
