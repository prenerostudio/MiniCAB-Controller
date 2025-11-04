<?php
include('../../configuration.php');
include('../../session.php');

if(isset($_POST['del_d_id'])){
    $del_d_id = $_POST['del_d_id'];
    $status = 2;

    $sql = "UPDATE `delete_drivers` SET `req_status`='$status' WHERE `del_d_id`='$del_d_id'";
    $result = $connect->query($sql);

    if($result){
        $activity_type = 'Driver Account Deletion Request Cancelled';
        $user_type = 'user';
        $details = "Driver Account Deletion Request has been cancelled.";

        $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`)
                   VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        mysqli_query($connect, $actsql);

        echo 'success';
    } else {
        echo 'error';
    }
}
?>
