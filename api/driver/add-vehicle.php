<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Sanitize and validate input
$d_id  = isset($_POST['d_id']) ? mysqli_real_escape_string($connect, $_POST['d_id']) : null;
$v_id = $_POST['v_id'];
$v_make = $_POST['v_make'];
$v_model = $_POST['v_model'];
$v_color = $_POST['v_color'];
$v_reg_num  = $_POST['v_reg_num'];
$v_phv  = $_POST['v_phv'];
$v_phv_expiry  = $_POST['v_phv_expiry'];
$v_ti  = $_POST['v_ti'];
$v_ti_expiry  = $_POST['v_ti_expiry'];
$v_mot  = $_POST['v_mot'];
$v_mot_expiry  = $_POST['v_mot_expiry'];								
$date = date("Y-m-d H:i:s");

if ($d_id) {
    $chksql = "SELECT * FROM `driver_vehicle` WHERE `d_id`='$d_id'";
    $chkr = mysqli_query($connect, $chksql);

    if ($chkr && mysqli_num_rows($chkr) > 0) {
        echo json_encode(array('message' => "Vehicle Already Added", 'status' => false));
    } else {
        $sql = "INSERT INTO `driver_vehicle` (
                    `v_id`,
                    `d_id`,
                    `v_make`,
                    `v_model`,
                    `v_color`,
                    `v_reg_num`,
                    `v_phv`,
                    `v_phv_expiry`,
                    `v_ti`,
                    `v_ti_expiry`,
                    `v_mot`,
                    `v_mot_expiry`,
                    `date_v_add`
                ) VALUES (
                    '$v_id',
                    '$d_id',
                    '$v_make',
                    '$v_model',
                    '$v_color',
                    '$v_reg_num',
                    '$v_phv',
                    '$v_phv_expiry',
                    '$v_ti',
                    '$v_ti_expiry',
                    '$v_mot',
                    '$v_mot_expiry',
                    '$date')";
        $r = mysqli_query($connect, $sql);

        if ($r) {
            echo json_encode(array('message' => "Vehicle Added Successfully", 'status' => true));
        } else {
            echo json_encode(array('message' => "Error In Adding Vehicle", 'status' => false));
        }
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
