<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Check if 'd_id' is set in POST request
if (isset($_POST['d_id'])) {
	
    $d_id = $_POST['d_id'];
    $currentDate = date('Y-m-d', strtotime('+1 day'));  
    $nextWeekEndDate = date('Y-m-d', strtotime('+7 days', strtotime($currentDate)));  
    
    // SQL query to fetch jobs
    $sql = "SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, clients.c_address, drivers.d_name, drivers.d_email, drivers.d_phone, bookings.* 
            FROM jobs 
            JOIN drivers ON jobs.d_id = drivers.d_id 
            JOIN clients ON jobs.c_id = clients.c_id 
            JOIN bookings ON jobs.book_id = bookings.book_id 
            JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id 
            WHERE jobs.d_id = '$d_id' 
              AND jobs.job_status != 'Completed' 
              AND bookings.pick_date BETWEEN '$currentDate' AND '$nextWeekEndDate' 
            ORDER BY jobs.job_id DESC";

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
