<?php
// Include your database connection file or establish a connection here
include('config.php');

// Check if v_id is provided in the POST request
if(isset($_POST['v_id'])) {
    $v_id = $_POST['v_id'];

    // Query the database to get the pricing for the selected vehicle
    $query = "SELECT v_pricing FROM vehicles WHERE v_id = ?";
    $stmt = $connect->prepare($query);
    $stmt->bind_param('i', $v_id);
    
    if ($stmt->execute()) {
        $stmt->bind_result($v_pricing);
        if ($stmt->fetch()) {
            // Return the pricing as a JSON response
            echo json_encode(['success' => true, 'pricing' => $v_pricing]);
        } else {
            // Vehicle not found
            echo json_encode(['success' => false, 'error' => 'Vehicle not found']);
        }
    } else {
        // Query execution failed
        echo json_encode(['success' => false, 'error' => 'Query execution failed']);
    }

    // Close the database connection
    $stmt->close();
    $connect->close();
} else {
    // v_id not provided in the request
    echo json_encode(['success' => false, 'error' => 'v_id not provided']);
}
?>
