<?php
include('config.php');
include('session.php');

$del_d_id = $_GET['del_d_id'];
$status = 1;
$dstatus = 3;

$fetchsql = "SELECT * FROM `delete_drivers` WHERE `del_d_id`=?";
$fetchstmt = $connect->prepare($fetchsql);
$fetchstmt->bind_param('i', $del_d_id);
$fetchstmt->execute();
$fetchresult = $fetchstmt->get_result();
$fetchrow = $fetchresult->fetch_assoc();

$d_id = $fetchrow['d_id'];

$updatesql = "UPDATE `delete_drivers` SET `req_status`=? WHERE `del_d_id`=?";
$updatestmt = $connect->prepare($updatesql);
$updatestmt->bind_param('ii', $status, $del_d_id);
$update_result = $updatestmt->execute();

if ($update_result) {
    $dsql = "UPDATE `drivers` SET `acount_status`=? WHERE `d_id`=?";
    $dstmt = $connect->prepare($dsql);
    $dstmt->bind_param('ii', $dstatus, $d_id);
    $dstmt->execute();

    $activity_type = 'Driver Account Deletion Request Approved';
    $user_type = 'user';
    $details = "Driver Account Deletion Request has been Approved.";

    $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";
    $actstmt = $connect->prepare($actsql);
    $actstmt->bind_param('ssis', $activity_type, $user_type, $myId, $details);
    $actstmt->execute();

    header('Location: driver-delete-request.php');
} else {
    header('Location: driver-delete-request.php');
}
?>
