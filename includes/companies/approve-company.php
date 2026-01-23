<?php
include('../../configuration.php');
include('../../session.php');

if(isset($_POST['com_id'])){
    $c_id = $_POST['com_id'];
    $status = 1;
    $date_update = date('Y-m-d H:i:s'); 
    $sql = "UPDATE companies SET acount_status='$status', update_com_date='$date_update' WHERE com_id='$c_id'";
    if($connect->query($sql)){
        $activity_type = 'Company Verified';
        $user_type = 'user';
        $details = "Company $c_id Has Been Verified by Controller.";
        $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        mysqli_query($connect, $actsql);
        echo 'success';
    } else {
        echo 'error';
    }
}
?>
