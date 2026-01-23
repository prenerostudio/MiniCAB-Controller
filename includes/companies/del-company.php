<?php
include('../../configuration.php');
include('../../session.php');

if (isset($_POST['com_id'])) {
    $com_id = $_POST['com_id'];
    $sql = "DELETE FROM companies WHERE com_id='$com_id'";
    if ($connect->query($sql)) {
        $activity_type = 'Company Profile Deleted';
        $user_type = 'user';
        $details = "Company Profile $com_id Has Been Deleted by Controller.";
        $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        mysqli_query($connect, $actsql);
        echo 'success';
    } else {
        echo 'error';
    }
}
?>