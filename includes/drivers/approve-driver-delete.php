<?php
include('../../configuration.php');
include('../../session.php');

if (isset($_POST['del_d_id'])) {
    $del_d_id = $_POST['del_d_id'];
    $status = 1;
    $dstatus = 5;

    // Fetch driver ID
    $fetchsql = "SELECT `d_id` FROM `delete_drivers` WHERE `del_d_id`=?";
    $fetchstmt = $connect->prepare($fetchsql);
    $fetchstmt->bind_param('i', $del_d_id);
    $fetchstmt->execute();
    $fetchresult = $fetchstmt->get_result();
    $fetchrow = $fetchresult->fetch_assoc();

    if ($fetchrow) {
        $d_id = $fetchrow['d_id'];

        // Update delete_drivers status
        $updatesql = "UPDATE `delete_drivers` SET `req_status`=? WHERE `del_d_id`=?";
        $updatestmt = $connect->prepare($updatesql);
        $updatestmt->bind_param('ii', $status, $del_d_id);
        $update_result = $updatestmt->execute();

        if ($update_result) {
            // Update driver account status
            $dsql = "UPDATE `drivers` SET `acount_status`=? WHERE `d_id`=?";
            $dstmt = $connect->prepare($dsql);
            $dstmt->bind_param('ii', $dstatus, $d_id);
            $dstmt->execute();

            // Log activity
            $activity_type = 'Driver Account Deletion Request Approved';
            $user_type = 'user';
            $details = 'Driver Account Deletion Request has been Approved.';

            $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
                       VALUES (?, ?, ?, ?)";
            $actstmt = $connect->prepare($actsql);
            $actstmt->bind_param('ssis', $activity_type, $user_type, $myId, $details);
            $actstmt->execute();

            echo 'success';
            exit;
        }
    }

    echo 'error';
}
?>
