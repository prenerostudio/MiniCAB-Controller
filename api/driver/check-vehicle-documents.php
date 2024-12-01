<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Check if required POST parameters are set and not empty
if (!empty($_POST['d_id']) && !empty($_POST['status'])) {
    $d_id = $_POST['d_id']; 
    $status = $_POST['status'];  

    // Prepare the query to check if required vehicle documents are uploaded
    $checksql = "
        SELECT
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
        JOIN vehicle_log_book ON vehicle_log_book.d_id = drivers.d_id
        JOIN vehicle_mot ON vehicle_mot.d_id = drivers.d_id
        JOIN vehicle_pco ON vehicle_pco.d_id = drivers.d_id
        JOIN vehicle_insurance ON vehicle_insurance.d_id = drivers.d_id
        JOIN vehicle_pictures ON vehicle_pictures.d_id = drivers.d_id
        JOIN vehicle_road_tax ON vehicle_road_tax.d_id = drivers.d_id
        JOIN rental_agreement ON rental_agreement.d_id = drivers.d_id
        JOIN vehicle_ins_schedule ON vehicle_ins_schedule.d_id = drivers.d_id
        JOIN vehicle_extras ON vehicle_extras.d_id = drivers.d_id
        WHERE
            drivers.d_id = ?";
    
    // Prepare and execute the check query
    if ($stmt = $connect->prepare($checksql)) {
        $stmt->bind_param("s", $d_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $datacheck = $result->fetch_assoc();
        $stmt->close();
        
        // Check if essential documents are uploaded
        if (empty($datacheck['mot_img']) && 
            empty($datacheck['vpco_img']) && 
            empty($datacheck['vi_img']) && 
            empty($datacheck['rt_img']) && 
            empty($datacheck['ra_img'])) {
            echo json_encode(array('message' => "You cannot go online without uploading vehicle documents", 'status' => false));
        } else {
            // Update the driver's status
            $updateSql = "UPDATE drivers SET status = ? WHERE d_id = ?";
            
            if ($stmt = $connect->prepare($updateSql)) {
                $stmt->bind_param("ss", $status, $d_id);
                $stmt->execute();
                $stmt->close();

                if ($stmt->affected_rows > 0) {
                    echo json_encode(array('message' => "Status updated successfully", 'status' => true));
                } else {
                    echo json_encode(array('message' => "Error in updating status", 'status' => false));
                }
            } else {
                echo json_encode(array('message' => "Database query error", 'status' => false));
            }
        }
    } else {
        echo json_encode(array('message' => "Database query error", 'status' => false));
    }
} else {
    // If either d_id or status is empty, show this message
    echo json_encode(array('message' => "Driver ID or Status is missing", 'status' => false));
}
?>
