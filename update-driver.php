<?php
require 'config.php';
include('session.php');

// Collect form data
$d_id = $_POST['d_id'];
$dname = $_POST['dname'];
$demail = $_POST['demail'];
$dphone = $_POST['dphone'];
$dgender = $_POST['dgender'];
$daddress = $_POST['daddress'];
$dauth = $_POST['dauth'];
$pc = $_POST['pc'];
$dlang = $_POST['dlang'];

// Prepare and execute the update query
$sql = "UPDATE `drivers` SET 
            `d_name` = ?, 
            `d_email` = ?, 
            `d_phone` = ?, 
            `d_address` = ?, 
            `d_post_code` = ?, 
            `d_gender` = ?, 
            `d_language` = ?, 
            `licence_authority` = ? 
        WHERE `d_id` = ?";
        
$stmt = $connect->prepare($sql);
$stmt->bind_param("sssssssss", $dname, $demail, $dphone, $daddress, $pc, $dgender, $dlang, $dauth, $d_id);

if ($stmt->execute()) {
    // Log the activity
    $activity_type = 'Driver Profile Updated';	
    $user_type = 'user';	
    $details = "Driver " . $dname . " profile has been updated by Controller.";
    
    $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";
    $actstmt = $connect->prepare($actsql);
    $actstmt->bind_param("ssss", $activity_type, $user_type, $myId, $details);
    $actstmt->execute();
    
    // Redirect to the driver view page
    header('Location: view-driver.php?d_id=' . $d_id);
    exit();
} else {
    // Handle errors gracefully
    echo "Error updating record: " . $connect->error;
    header('Location: view-driver.php?d_id=' . $d_id);
    exit();
}

// Close the connection
$connect->close();
?>
