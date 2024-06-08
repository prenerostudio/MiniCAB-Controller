<?php
session_start();
include('config.php');

// Get POST data and sanitize inputs
$d_name = mysqli_real_escape_string($connect, $_POST['d_name']);
$d_phone = mysqli_real_escape_string($connect, $_POST['d_phone']);
$d_email = mysqli_real_escape_string($connect, $_POST['d_email']);
$d_post = mysqli_real_escape_string($connect, $_POST['post_code']);
$v_id = mysqli_real_escape_string($connect, $_POST['v_id']);
$pco = mysqli_real_escape_string($connect, $_POST['pco']);
$status = 0;

// Check if the driver already exists
$checksql = "SELECT * FROM `drivers` WHERE `d_phone`='$d_phone'";
$checkr = mysqli_query($connect, $checksql);

if ($checkr && mysqli_num_rows($checkr) > 0) {
    $_SESSION['success_msg'] = "Your Account already exists with this number. Try another or login via Mobile App.";
    header('Location: index.php');
} else {
    // Insert new driver
    $sql = "INSERT INTO `drivers`(`d_name`, `d_email`, `d_phone`, `d_post_code`, `pco_num`, `acount_status`) VALUES ('$d_name', '$d_email', '$d_phone', '$d_post', '$pco', '$status')";
    $r = mysqli_query($connect, $sql);

    if ($r) {
        $d_id = mysqli_insert_id($connect);

        // Link driver to vehicle
        $vsql = "INSERT INTO `driver_vehicle`(`v_id`, `d_id`) VALUES ('$v_id', '$d_id')";
        $vr = mysqli_query($connect, $vsql);

        // Log the activity
        $actsql = "INSERT INTO `activity_log` (`activity_type`, `user`, `details`) VALUES ('New Driver Registered', '$d_name', 'New Driver $d_name has been registered through Web Link')";
        $actr = mysqli_query($connect, $actsql);

        $_SESSION['success_msg'] = "Thanks for Account Registration with MiniCAB Services! We will get back to you via SMS/Email.";
        header('Location: success-message.php');
        exit();
    } else {
        $_SESSION['success_msg'] = "Error in Account Registration. Try Again Later!";
        header('Location: index.php');
    }
}

$connect->close();
?>
