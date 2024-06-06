<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];

if (isset($_POST['d_id'])) {
    // Get today's date
    $currentDate = date('Y-m-d');

    // Modify your SQL query to join the jobs table with the bookings table and filter by pick_date
    $sql = "SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, clients.c_address, drivers.d_name, drivers.d_email, drivers.d_phone, bookings.* FROM jobs 
            INNER JOIN bookings ON jobs.book_id = bookings.book_id
            INNER JOIN drivers ON jobs.d_id = drivers.d_id
            INNER JOIN clients ON jobs.c_id = clients.c_id
            WHERE jobs.d_id = '$d_id' 
            AND jobs.job_status = 'accepted' 
            AND DATE(bookings.pick_date) = '$currentDate' 
            ORDER BY bookings.pick_time ASC";

    $r = mysqli_query($connect, $sql);
    $output = mysqli_fetch_all($r, MYSQLI_ASSOC);
    if (count($output) > 0) {
        echo json_encode(array('data' => $output, 'status' => true, 'message' => "Job List Fetch Successfully"));
    } else {
        echo json_encode(array('message' => 'No Job is Available for Today', 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
