<?php
include('config.php');
include('session.php');

// Retrieve POST data
$special_date = $_POST['mdate'];
$event_name = $_POST['ename'];
$percent_increment = $_POST['inc'];

// Prepare the SQL statement for inserting special dates
$stmt = $connect->prepare("INSERT INTO `special_dates` (`special_date`, `event_name`, `percent_increment`) VALUES (?, ?, ?)");
$stmt->bind_param("ssi", $special_date, $event_name, $percent_increment);

if ($stmt->execute()) {
    // Log the activity
    $activity_type = 'Special Date Added';
    $user_type = 'user';
    $details = "Controller has added a Special Date: $special_date for Price Upgradation.";

    // Prepare the SQL statement for logging activity
    $actstmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $actstmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $actstmt->execute();

    // Redirect on success
    header('Location: pricing.php');
    exit();
} else {
    // Redirect on failure
    header('Location: pricing.php');
    exit();
}

// Close connections
$stmt->close();
$actstmt->close();
$connect->close();
?>
