<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

if(isset($_POST['d_id'])){	    
    $d_id = $_POST['d_id'];
    
    $sql = "SELECT `log_book` FROM `vehicle_documents` WHERE `d_id`='$d_id'";        
    $result = mysqli_query($connect, $sql);
   
    if(mysqli_num_rows($result) > 0) {       
        $output = mysqli_fetch_all($result, MYSQLI_ASSOC);                
        echo json_encode(array('data' => $output, 'status' => true));
    } else {       
        echo json_encode(array('message' => 'No Record Found', 'status' => false));
    }
} else {    
    echo json_encode(array('message' => 'Some Fields are missing', 'status' => false));
}
?>