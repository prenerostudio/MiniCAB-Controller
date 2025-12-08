<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

$d_id = $_POST['d_id'] ?? null;
if ($d_id) {
    $sql = "SELECT invoice.*, jobs.*, clients.*, drivers.*, bookings.*, booking_type.*, SUM(invoice.driver_commission) AS total_pay_amount FROM invoice INNER JOIN jobs ON invoice.job_id = jobs.job_id INNER JOIN clients ON invoice.c_id = clients.c_id INNER JOIN drivers ON invoice.d_id = drivers.d_id INNER JOIN bookings ON jobs.book_id = bookings.book_id INNER JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id WHERE invoice.d_id = ? GROUP BY invoice.invoice_id ORDER BY invoice.invoice_id DESC";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param('s', $d_id);  // Assuming d_id is a string; adjust the type as necessary
    $stmt->execute();
    $result = $stmt->get_result();    
    $invoices = [];
    $total_pay_amount = 0;
    while ($row = $result->fetch_assoc()) {
        $invoices[] = $row;
        $total_pay_amount += $row['total_pay_amount'];
    }
    if (!empty($invoices)) {
        echo json_encode([
            'data' => $invoices, 
            'total_Commission_amount' => $total_pay_amount, 
            'status' => true, 
            'message' => "Invoice List Fetched Successfully"
        ]);
    } else {
        echo json_encode([
            'message' => 'No Invoice Found!', 
            'status' => false
        ]);
    }
    $stmt->close();
} else {
    echo json_encode([
        'message' => "Some Fields are Missing", 
        'status' => false
    ]);
}
$connect->close();
?>