<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];

if (isset($_POST['d_id'])) {   
    $start_date = date('Y-m-d', strtotime('-7 days'));
    $end_date = date('Y-m-d');

    $sql = "SELECT invoice.*, jobs.book_id, drivers.*, bookings.*, booking_type.*, clients.* FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN clients ON jobs.c_id = clients.c_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE invoice.d_id = '$d_id' AND invoice.invoice_date BETWEEN '$start_date 00:00:00' AND '$end_date 23:59:59'";

    $result = mysqli_query($connect, $sql);
    
    if (!$result) {
        echo json_encode(array('message' => 'Error executing query: ' . mysqli_error($connect), 'status' => false));
    } else {
        $output = mysqli_fetch_all($result, MYSQLI_ASSOC);
        if ($output) {
            echo json_encode(array('data' => $output, 'status' => true, 'message' => "Invoices for the last week fetched successfully"));
        } else {
            echo json_encode(array('message' => 'No invoices found for the last week', 'status' => false));
        }
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
