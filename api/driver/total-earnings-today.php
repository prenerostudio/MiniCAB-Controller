<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];

if (isset($_POST['d_id'])) {
    // Calculate the start and end dates for today
    $start_date = date('Y-m-d');
    $end_date = date('Y-m-d');

    $sql = "SELECT SUM(invoice.total_pay) AS total_amount FROM invoice JOIN jobs ON invoice.job_id = jobs.job_id JOIN drivers ON invoice.d_id = drivers.d_id JOIN bookings ON jobs.book_id = bookings.book_id JOIN clients ON jobs.c_id = clients.c_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE invoice.d_id = $d_id AND DATE(invoice.invoice_date) BETWEEN '$start_date' AND '$end_date'";

    $result = mysqli_query($connect, $sql);
    
    if (!$result) {
        echo json_encode(array('message' => 'Error executing query: ' . mysqli_error($connect), 'status' => false));
    } else {
        $row = mysqli_fetch_assoc($result);
        $total_amount = $row['total_amount'];
        
        if ($total_amount !== null) {
            echo json_encode(array('total_amount' => $total_amount, 'status' => true, 'message' => "Total amount of invoices for today fetched successfully"));
        } else {
            echo json_encode(array('message' => 'No invoices found for today', 'status' => false));
        }
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
