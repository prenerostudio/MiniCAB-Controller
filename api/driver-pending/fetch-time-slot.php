<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Set the default timezone (adjust this to your timezone if needed)
date_default_timezone_set('Asia/Karachi'); // or use your desired timezone

if(isset($_POST['d_id'])) {    
    $d_id = $_POST['d_id'];
    
    // Get the current date and time
    $current_date = date('Y-m-d'); 
    $current_time = date('H:i:s'); // Get the current time

    // SQL query to fetch upcoming time slots where the date is greater or the date is equal and start time is greater than current time
    $sql = "SELECT time_slots.*, drivers.* 
            FROM time_slots 
            JOIN drivers ON time_slots.d_id = drivers.d_id 
            WHERE time_slots.d_id = '$d_id' 
            AND time_slots.ts_status = 5 
            AND (time_slots.ts_date > '$current_date' 
            OR (time_slots.ts_date = '$current_date' AND time_slots.start_time > '$current_time')) 
            ORDER BY time_slots.ts_date ASC, time_slots.start_time ASC 
            LIMIT 1"; // Fetch only the next upcoming record

    $r = mysqli_query($connect, $sql);

    // Check for errors in the SQL query
    if(!$r) {
        echo json_encode(array('message' => 'Query Error: ' . mysqli_error($connect), 'status' => false));
        exit;
    }

    // If there are results, fetch the data
    if(mysqli_num_rows($r) > 0) {    
        $output = mysqli_fetch_all($r, MYSQLI_ASSOC);    
        echo json_encode(array('data' => $output, 'status' => true));
    } else {    
        echo json_encode(array('message' => 'No upcoming Time Slot', 'status' => false));    
    }
} else {    
    echo json_encode(array('message' => 'Some fields are missing', 'status' => false));
}
?>
