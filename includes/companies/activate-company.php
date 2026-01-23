<?php
include('../../configuration.php');
include('../../session.php');

if (isset($_POST['com_id'])) {
    $com_id = $_POST['com_id'];
    $status = 1;
    $sql = "UPDATE companies SET acount_status='$status' WHERE com_id='$com_id'";
    if ($connect->query($sql)) {
        $activity_type = 'Activate Company';
        $user_type = 'user';
        $details = "Company ID: $com_id Has Been Activated";
        $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        mysqli_query($connect, $actsql);
        echo 'success';
    } else {
        echo 'error';
    }
}
?>