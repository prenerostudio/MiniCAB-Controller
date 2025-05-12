<?php
require 'config.php';
include('session.php');

// Sanitize and collect form data
$d_id       = $_POST['d_id'];
$dname      = trim($_POST['dname']);
$demail     = trim($_POST['demail']);
$dphone     = trim($_POST['dphone']);
$dgender    = $_POST['dgender'];
$daddress   = trim($_POST['daddress']);
$dauth      = $_POST['dauth'];
$pc         = $_POST['pc'];
$dlang      = $_POST['dlang'];
$dwa        = $_POST['dwa'];
$dshift     = $_POST['dshift'];
$dpco       = $_POST['dpco'];
$v_id       = $_POST['v_id'];
$date       = date("Y-m-d H:i:s");

// Begin transaction for consistency
$connect->begin_transaction();

try {
    // Update driver details
    $sql = "UPDATE `drivers` SET 
                `d_name` = ?, 
                `d_email` = ?, 
                `d_phone` = ?, 
                `d_address` = ?, 
                `d_post_code` = ?, 
                `d_gender` = ?, 
                `d_language` = ?, 
                `licence_authority` = ?, 
                `d_whatsapp` = ?, 
                `d_shift` = ?, 
                `d_pco` = ?, 
                `driver_update_at` = ?
            WHERE `d_id` = ?";

    $stmt = $connect->prepare($sql);
    $stmt->bind_param("ssssssssssssi", $dname, $demail, $dphone, $daddress, $pc, $dgender, $dlang, $dauth, $dwa, $dshift, $dpco, $date, $d_id);
    $stmt->execute();

    // Update assigned vehicle
    $vsql = "UPDATE `driver_vehicle` SET `v_id` = ? WHERE `d_id` = ?";
    $vstmt = $connect->prepare($vsql);
    $vstmt->bind_param("ii", $v_id, $d_id);
    $vstmt->execute();

    // Log activity
    $activity_type = 'Driver Profile Updated';
    $user_type     = 'user';
    $details       = "Driver $dname profile has been updated by Controller.";

    $logsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) 
               VALUES (?, ?, ?, ?)";
    $logstmt = $connect->prepare($logsql);
    $logstmt->bind_param("ssss", $activity_type, $user_type, $myId, $details);
    $logstmt->execute();

    // Commit all changes
    $connect->commit();

    // Redirect on success
    header('Location: view-driver.php?d_id=' . $d_id);
    exit();

} catch (Exception $e) {
    // Rollback on error
    $connect->rollback();
    echo "Error updating record: " . $e->getMessage();
    header('Location: view-driver.php?d_id=' . $d_id);
    exit();
} finally {
    // Clean up
    $stmt->close();
    $vstmt->close();
    $logstmt->close();
    $connect->close();
}
?>
