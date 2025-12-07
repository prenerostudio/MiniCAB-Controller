<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

$d_id = $_POST['d_id'];

if (isset($_POST['d_id'])) {    
    $currentDate = date('Y-m-d');    
    $startOfWeek = date('Y-m-d', strtotime('last monday', strtotime($currentDate)));    
    $endOfWeek = date('Y-m-d', strtotime('next sunday', strtotime($currentDate)));

    $sql = "SELECT j.*, c.c_name, c.c_email, c.c_phone, c.c_address, d.d_name, d.d_email, d.d_phone, b.*, bt.* FROM jobs AS j JOIN bookings AS b ON j.book_id = b.book_id JOIN clients AS c ON j.c_id = c.c_id JOIN drivers AS d ON j.d_id = d.d_id JOIN booking_type AS bt ON b.b_type_id = bt.b_type_id WHERE j.d_id = '$d_id' AND j.job_status = 'accepted' AND j.date_job_add BETWEEN '$startOfWeek' AND '$endOfWeek' ORDER BY j.job_id DESC";

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
