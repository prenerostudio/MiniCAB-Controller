<?php
include('config.php'); // Include your database connection file

// Get the booking type ID from the AJAX request
$b_type_id = isset($_POST['b_type_id']) ? intval($_POST['b_type_id']) : 0;

// Prepare the SQL query to fetch clients
$query = "SELECT c_id, c_name FROM clients WHERE b_type_id = ?";
$stmt = $connect->prepare($query);
$stmt->bind_param('i', $b_type_id);
$stmt->execute();
$result = $stmt->get_result();

// Generate the options for the dropdown
$options = '<option value="">Select Customer</option>'; // Default option
while ($row = $result->fetch_assoc()) {
    $options .= '<option value="' . htmlspecialchars($row['c_id']) . '">' . htmlspecialchars($row['c_name']) . '</option>';
}

// Output the options
echo $options;

// Close the statement and connection
$stmt->close();
$connect->close();
?>
