<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];
if (isset($_POST['d_id'])) {    
    $currentDate = date('Y-m-d');    
    $startOfWeek = date('Y-m-d', strtotime('last monday', strtotime($currentDate)));    
    $endOfWeek = date('Y-m-d', strtotime('next sunday', strtotime($currentDate)));    
    $sql = "SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, clients.c_address, drivers.d_name, drivers.d_email, drivers.d_phone, bookings.* FROM jobs, drivers, clients, bookings, booking_type WHERE jobs.book_id = bookings.book_id AND jobs.c_id = clients.c_id AND jobs.d_id = drivers.d_id AND jobs.d_id = '$d_id' AND jobs.job_status = 'Waiting' AND bookings.b_type_id = booking_type.b_type_id AND jobs.date_job_add BETWEEN '$startOfWeek' AND '$endOfWeek' ORDER BY jobs.job_id DESC";
    $r = mysqli_query($connect, $sql);
    $output = mysqli_fetch_all($r, MYSQLI_ASSOC);
    if (count($output) > 0) {
        echo json_encode(array('data' => $output, 'status' => true, 'message' => "Job List Fetch Successfully"));
    } else {
        echo json_encode(array('message' => 'No Job is Available', 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>