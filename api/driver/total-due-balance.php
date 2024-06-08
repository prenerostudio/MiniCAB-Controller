<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

if(isset($_POST['d_id'])){    
    $d_id = mysqli_real_escape_string($connect, $_POST['d_id']);
        
    $sql = "SELECT d_id, SUM(d_com) AS total_commission FROM driver_accounts WHERE d_id = '$d_id' AND driver_accounts.com_status = 'Unpaid' GROUP BY d_id";   
    $result = mysqli_query($connect, $sql);    
    if(mysqli_num_rows($result) > 0){       
        $output = mysqli_fetch_assoc($result);        
        echo json_encode(array('data' => $output, 'status' => true, 'message' => "Total commission fetched successfully"));
    } else {        
        echo json_encode(array('message' => 'No commission found for the given Driver', 'status' => false));
    }
} else {
    
    echo json_encode(array('message' => "Driver ID is missing in the request", 'status' => false));
}
?>