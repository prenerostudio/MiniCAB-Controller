<?php
require '../../configuration.php';
include('../../session.php');

$dv_id = $_POST['dv_id'];
$d_id = $_POST['d_id'];
$v_id = $_POST['v_id'];
$make = $_POST['make'];
$model = $_POST['model'];
$color = $_POST['color'];
$reg_num = $_POST['reg_num'];
$phv = $_POST['phv'];
$phv_exp = $_POST['phv_exp'];
$taxi_ins = $_POST['taxi_ins'];
$taxi_exp = $_POST['taxi_exp'];
$mot = $_POST['mot'];
$mot_exp = $_POST['mot_exp'];

$response = [];

$sql = "UPDATE `driver_vehicle` SET 
    `v_id`='$v_id',
    `v_make`='$make',
    `v_model`='$model',
    `v_color`='$color',
    `v_reg_num`='$reg_num',
    `v_phv`='$phv',
    `v_phv_expiry`='$phv_exp',
    `v_ti`='$taxi_ins',
    `v_ti_expiry`='$taxi_exp',
    `v_mot`='$mot',
    `v_mot_expiry`='$mot_exp'
    WHERE `dv_id`='$dv_id'";

if (mysqli_query($connect, $sql)) {
    // Log activity
    $activity_type = 'Driver Vehicle Details Update';
    $user_type = 'user';
    $details = 'Driver Vehicle Details has been updated by Controller.';
    mysqli_query($connect, "INSERT INTO activity_log (activity_type, user_type, user_id, details)
                            VALUES ('$activity_type', '$user_type', '$myId', '$details')");

    

    $response = [
        'status' => 'success',
        'message' => 'Vehicle details updated successfully!'
    ];
} else {
    $response = [
        'status' => 'error',
        'message' => 'Error updating vehicle details.'
    ];
}

header('Content-Type: application/json');
echo json_encode($response);
$connect->close();
?>
