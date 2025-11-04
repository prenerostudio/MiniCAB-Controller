<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $c_id = $_POST['c_id'];
    $cname = $_POST['cname'];
    $cemail = $_POST['cemail'];
    $cgender = $_POST['cgender'];
    $clang = $_POST['clang'];
    $pc = $_POST['postal_code'];
    $cni = $_POST['cni'];
    $caddress = $_POST['caddress'];

    $sql = "UPDATE `clients` SET  
                `c_name`='$cname',
                `c_email`='$cemail',
                `c_address`='$caddress',
                `c_gender`='$cgender',
                `c_language`='$clang',
                `postal_code`='$pc',
                `c_ni`='$cni'
            WHERE `c_id`='$c_id'";

    if (mysqli_query($connect, $sql)) {
        $activity_type = 'Customer Profile Updated';
        $user_type = 'user';
        $details = "Customer $c_id has been updated by Controller.";
        
        $actsql = "INSERT INTO `activity_log`(
                        `activity_type`, 
                        `user_type`, 
                        `user_id`, 
                        `details`
                    ) VALUES (
                        '$activity_type',
                        '$user_type',
                        '$myId',
                        '$details')";
        mysqli_query($connect, $actsql);

        echo json_encode([
            'status' => 'success',
            'message' => 'Customer information updated successfully!'
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Database update failed.'
        ]);
    }
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid request method.'
    ]);
}
?>
