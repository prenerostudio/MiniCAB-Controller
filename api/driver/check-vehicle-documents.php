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
    
    $checksql = "SELECT
    drivers.*,
    vehicle_log_book.lb_img,
    vehicle_mot.mot_img,
    vehicle_pco.vpco_img,
    vehicle_insurance.vi_img,
    vehicle_pictures.vp_front,
    vehicle_pictures.vp_back,
    vehicle_road_tax.rt_img,
    rental_agreement.ra_img,
    vehicle_ins_schedule.is_img,
    vehicle_extras.ve_img
FROM
    drivers
JOIN
    vehicle_log_book ON vehicle_log_book.d_id = drivers.d_id
JOIN
    vehicle_mot ON vehicle_mot.d_id = drivers.d_id
JOIN
    vehicle_pco ON vehicle_pco.d_id = drivers.d_id
JOIN
    vehicle_insurance ON vehicle_insurance.d_id = drivers.d_id
JOIN
    vehicle_pictures ON vehicle_pictures.d_id = drivers.d_id
JOIN
    vehicle_road_tax ON vehicle_road_tax.d_id = drivers.d_id
JOIN
    rental_agreement ON rental_agreement.d_id = drivers.d_id
JOIN
    vehicle_ins_schedule ON vehicle_ins_schedule.d_id = drivers.d_id
JOIN
    vehicle_extras ON vehicle_extras.d_id = drivers.d_id
WHERE
    drivers.d_id = '$d_id'";        
    $checkr = mysqli_query($connect, $checksql);                
    $datacheck = mysqli_fetch_assoc($checkr);
    
    if (empty($datacheck['mot_img']) && empty($datacheck['vpco_img']) && empty($datacheck['vi_img']) && empty($datacheck['rt_img']) && empty($datacheck['ra_img'])) {
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
