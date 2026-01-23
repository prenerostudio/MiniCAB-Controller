<?php
include('../../configuration.php');
include('../../session.php');

if (isset($_POST['com_id'])) {
    $com_id = $_POST['com_id'];
    $sql = "UPDATE companies SET com_pic='' WHERE com_id='$com_id'";
    if ($connect->query($sql)) {
        $activity_type = 'Company Image Deleted';
        $user_type = 'user';
        $details = "Company Image $com_id Has Been Deleted by Controller.";
        $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        mysqli_query($connect, $actsql);
        echo 'success';
    } else {
        echo 'database error';
    }
}
?>