<?php
require '../../configuration.php';
include('../../session.php');

header('Content-Type: application/json');

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception('Invalid request method.');
    }

    // Sanitize inputs
    $d_id     = (int)$_POST['d_id'];
    $dname    = trim($_POST['dname']);
    $demail   = trim($_POST['demail']);
    $dphone   = trim($_POST['dphone']);
    $dgender  = trim($_POST['dgender']);
    $daddress = trim($_POST['daddress']);
    $dauth    = trim($_POST['dauth']);
    $pc       = trim($_POST['pc']);
    $dlang    = trim($_POST['dlang']);
    $dwa      = trim($_POST['dwa']);
    $dshift   = trim($_POST['dshift']);
    $dpco     = trim($_POST['dpco']);
    $v_id     = (int)$_POST['v_id'];
    $date     = date("Y-m-d H:i:s");

    // Update driver
    $sql = "UPDATE drivers SET 
                d_name=?, d_email=?, d_phone=?, d_address=?, d_post_code=?, 
                d_gender=?, d_language=?, licence_authority=?, d_whatsapp=?, 
                d_shift=?, d_pco=?, driver_update_at=? 
            WHERE d_id=?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param(
        "ssssssssssssi", 
        $dname, $demail, $dphone, $daddress, $pc, 
        $dgender, $dlang, $dauth, $dwa, $dshift, $dpco, $date, $d_id
    );
    $stmt->execute();
    $stmt->close();

    // Update vehicle assignment
    $vsql = "UPDATE driver_vehicle SET v_id = ? WHERE d_id = ?";
    $vstmt = $connect->prepare($vsql);
    $vstmt->bind_param("ii", $v_id, $d_id);
    $vstmt->execute();
    $vstmt->close();

    // Log activity
    $activity_type = 'Driver Profile Updated';
    $user_type = 'user';
    $details = "Driver $dname profile has been updated by Controller.";

    $logsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)";
    $logstmt = $connect->prepare($logsql);
    $logstmt->bind_param("ssss", $activity_type, $user_type, $myId, $details);
    $logstmt->execute();
    $logstmt->close();

    echo json_encode([
        'status' => 'success',
        'message' => 'Driver profile updated successfully.',
        'd_id' => $d_id
    ]);
} catch (Exception $e) {
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}
?>
