<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (isset($_POST['d_id'])) {
    $d_id = $_POST['d_id']; 
    $status = $_POST['status'];  
    
    $checksql = "SELECT * FROM `vehicle_documents` WHERE `d_id`='$d_id'";        
    $checkr = mysqli_query($connect, $checksql);                
    $datacheck = mysqli_fetch_assoc($checkr);
    
    if (empty($datacheck['log_book']) && empty($datacheck['mot_certificate']) && empty($datacheck['pco']) && empty($datacheck['insurance']) && empty($datacheck['road_tax']) && empty($datacheck['vehicle_picture_front']) && empty($datacheck['vehicle_picture_back']) ) {
        echo json_encode(array('message' => "You Cannot Go Online without uploading vehicle documents", 'status' => false));            
    } else {        
        $sql = "UPDATE `drivers` SET `status`='$status' WHERE `d_id`='$d_id'";                
        $result = mysqli_query($connect, $sql);
        if ($result) {       
            $response = array('message' => "Status Update Successfully", 'status' => true);
            echo json_encode($response);
        } else {    
            $response = array('message' => "Error In updating Status", 'status' => false);
            echo json_encode($response);
        }        
    }    
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
