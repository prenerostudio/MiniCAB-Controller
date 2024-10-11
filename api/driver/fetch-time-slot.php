<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

if(isset($_POST['d_id'])) {    
    $d_id = $_POST['d_id'];
    
    $sql = "SELECT time_slots.*, drivers.* 
            FROM time_slots 
            JOIN drivers ON time_slots.d_id = drivers.d_id 
            WHERE time_slots.d_id = '$d_id' 
            AND time_slots.ts_status = 5 
            ORDER BY time_slots.ts_added_time DESC 
            LIMIT 1"; // Fetch only one record
    $r = mysqli_query($connect, $sql);

    if($r) {    
        $output = mysqli_fetch_all($r, MYSQLI_ASSOC);    
        echo json_encode(array('data' => $output, 'status' => true));
    } else {    
        echo json_encode(array('message' => 'No Record Found', 'status' => false));    
    }
} else {    
    echo json_encode(array('message' => 'Some Fields are missing', 'status' => false));
}
?>
