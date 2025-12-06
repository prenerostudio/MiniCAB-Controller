<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Check if required POST parameters are set and not empty
if (isset($_POST['d_id'], $_POST['status']) && !empty(trim($_POST['d_id'])) && !empty(trim($_POST['status']))) {
    $d_id = trim($_POST['d_id']);
    $status = trim($_POST['status']);

    // Query to check if required vehicle documents are uploaded
    $checksql = "
        SELECT
            vehicle_log_book.lb_img,
            vehicle_mot.mot_img,
            vehicle_pco.vpco_img,
            vehicle_insurance.vi_img,
            vehicle_road_tax.rt_img,
            rental_agreement.ra_img,
            vehicle_extras.ve_img
        FROM
            drivers
        LEFT JOIN vehicle_log_book ON vehicle_log_book.d_id = drivers.d_id
        LEFT JOIN vehicle_mot ON vehicle_mot.d_id = drivers.d_id
        LEFT JOIN vehicle_pco ON vehicle_pco.d_id = drivers.d_id
        LEFT JOIN vehicle_insurance ON vehicle_insurance.d_id = drivers.d_id
        LEFT JOIN vehicle_road_tax ON vehicle_road_tax.d_id = drivers.d_id
        LEFT JOIN rental_agreement ON rental_agreement.d_id = drivers.d_id
        LEFT JOIN vehicle_extras ON vehicle_extras.d_id = drivers.d_id
        WHERE drivers.d_id = ?";
    
    if ($stmt = $connect->prepare($checksql)) {
        $stmt->bind_param("s", $d_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $datacheck = $result->fetch_assoc();
        $stmt->close();

        // Define required fields
        $required_fields = [
            'mot_img' => 'MOT document',
            'vpco_img' => 'PCO document',
            'vi_img' => 'Insurance document',
            'rt_img' => 'Road Tax document',
            'ra_img' => 'Rental Agreement document',
            've_img' => 'Vehicle Extras document'
        ];

        // Check if any required field is empty
        foreach ($required_fields as $field => $description) {
            if (empty($datacheck[$field]) || trim($datacheck[$field]) === '') {
                echo json_encode(['message' => "The $description is missing. Please upload it before going online.", 'status' => false]);
                exit;
            }
        }

        // Update the driver's status
        $updateSql = "UPDATE drivers SET status = ? WHERE d_id = ?";
        if ($stmt = $connect->prepare($updateSql)) {
            $stmt->bind_param("ss", $status, $d_id);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                echo json_encode(['message' => "Status updated successfully", 'status' => true]);
            } else {
                echo json_encode(['message' => "No changes made to the status", 'status' => false]);
            }
            $stmt->close();
        } else {
            echo json_encode(['message' => "Failed to prepare the update query", 'status' => false]);
        }
    } else {
        echo json_encode(['message' => "Failed to prepare the select query", 'status' => false]);
    }
} else {
    echo json_encode(['message' => "Driver ID or Status is missing or empty", 'status' => false]);
}
?>
