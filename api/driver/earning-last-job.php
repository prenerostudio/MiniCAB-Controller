<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (isset($_POST['d_id'])) {
    $d_id = intval($_POST['d_id']);  // Ensure 'd_id' is an integer

    // Prepare SQL statement
    $stmt = $connect->prepare("SELECT invoice.*, jobs.book_id, drivers.*, bookings.*, booking_type.*, clients.*
                               FROM invoice
                               JOIN jobs ON invoice.job_id = jobs.job_id
                               JOIN drivers ON invoice.d_id = drivers.d_id
                               JOIN bookings ON jobs.book_id = bookings.book_id
                               JOIN clients ON jobs.c_id = clients.c_id
                               JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id
                               WHERE invoice.d_id = ?
                               ORDER BY invoice.invoice_date DESC
                               LIMIT 1");

    if (!$stmt) {
        // Log error if statement preparation fails
        error_log("Prepare failed: " . $connect->error);
        echo json_encode(array('message' => "Database error", 'status' => false));
        exit();
    }

    // Bind parameters and execute
    $stmt->bind_param("i", $d_id);
    $executeResult = $stmt->execute();

    if (!$executeResult) {
        // Log error if statement execution fails
        error_log("Execute failed: " . $stmt->error);
        echo json_encode(array('message' => "Database error", 'status' => false));
        exit();
    }

    $result = $stmt->get_result();
    $output = $result->fetch_all(MYSQLI_ASSOC);

    // Respond with JSON
    if (!empty($output)) {
        echo json_encode(array('data' => $output, 'status' => true, 'message' => "Invoice Fetched Successfully"));
    } else {
        echo json_encode(array('message' => 'No Invoice Found in History', 'status' => false));
    }

    // Close the statement
    $stmt->close();
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}

// Close the database connection
$connect->close();
?>
