<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

// Include database configuration
include("../../../configuration.php");

// Check if 'd_id' is received
if (isset($_POST['d_id']) && !empty($_POST['d_id'])) {
    $d_id = $_POST['d_id'];
    $currentDate = date('Y-m-d');
    $currentTime = date('H:i:s'); // Get the current time

    // Prepare the SQL query using parameterized queries
    $sql = "SELECT jobs.*, clients.c_name, clients.c_email, clients.c_phone, clients.c_address, drivers.d_name, drivers.d_email, drivers.d_phone, bookings.* FROM jobs INNER JOIN bookings ON jobs.book_id = bookings.book_id INNER JOIN drivers ON jobs.d_id = drivers.d_id INNER JOIN clients ON jobs.c_id = clients.c_id WHERE jobs.d_id = ? AND jobs.job_status = 'accepted' AND (DATE(bookings.pick_date) = ? AND bookings.pick_time >= ? OR DATE(bookings.pick_date) > ?) ORDER BY bookings.pick_date ASC, bookings.pick_time ASC";

    // Prepare and execute the query
    if ($stmt = mysqli_prepare($connect, $sql)) {
        mysqli_stmt_bind_param($stmt, 'ssss', $d_id, $currentDate, $currentTime, $currentDate);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        // Check if SQL query execution was successful
        if ($result) {
            $output = mysqli_fetch_all($result, MYSQLI_ASSOC);

            if (count($output) > 0) {
                echo json_encode(array('data' => $output, 'status' => true, 'message' => "Job List Fetch Successfully"));
            } else {
                echo json_encode(array('message' => 'No Job is Available for Today and Upcoming', 'status' => false));
            }
        } else {
         
            echo json_encode(array('message' => 'SQL Error: ' . mysqli_stmt_error($stmt), 'status' => false));
        }

        mysqli_stmt_close($stmt);
    } else {
       
        echo json_encode(array('message' => 'SQL Preparation Error: ' . mysqli_error($connect), 'status' => false));
    }

} else {
  
    echo json_encode(array('message' => "Some Fields are missing or d_id is empty", 'status' => false));
}
?>
