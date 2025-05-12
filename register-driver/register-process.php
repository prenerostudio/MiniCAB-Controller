<?php
session_start();
include('config.php');

// Sanitize and assign POST data
$fname    = trim($_POST['fname']);
$email    = trim($_POST['email']);
$phone    = trim($_POST['phone']);
$whatsapp = trim($_POST['whatsapp']);
$pcode    = trim($_POST['pcode']);
$shift    = trim($_POST['shift']);
$pco      = trim($_POST['pco']);
$v_id     = trim($_POST['v_id']);
$make     = trim($_POST['make']);
$model    = trim($_POST['model']);
$password = trim($_POST['password']);
$status   = 0;
$signup_type = 3;

// Hash the password
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Check if driver already exists
$stmt = $connect->prepare("SELECT d_id FROM drivers WHERE d_phone = ?");
$stmt->bind_param("s", $phone);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    $_SESSION['success_msg'] = "Your Account already exists with this number. Try another or login via Mobile App.";
    header('Location: index.php');
    exit();
}
$stmt->close();

// Insert new driver
$stmt = $connect->prepare("INSERT INTO drivers (d_name, d_email, d_phone, d_password, d_post_code, d_whatsapp, d_shift, d_pco, acount_status, signup_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssssssii", $fname, $email, $phone, $hashed_password, $pcode, $whatsapp, $shift, $pco, $status, $signup_type);

if ($stmt->execute()) {
    $d_id = $stmt->insert_id;
    $stmt->close();

    // Link driver to vehicle
    $stmt = $connect->prepare("INSERT INTO driver_vehicle (v_id, d_id, v_make, v_model) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("iiss", $v_id, $d_id, $make, $model);
    $stmt->execute();
    $stmt->close();

    // Log activity
    $activity = "New Driver Registered";
	$user_type = "Driver";
    $details = "New Driver $fname has been registered through Web Link";
    $stmt = $connect->prepare("INSERT INTO `activity_log`( `activity_type`, `user_type`, `user_id`, `details`)  VALUES (?, ?, ?, ?)");
    $stmt->bind_param("sss", $activity, $user_type,  $d_id, $details);
    $stmt->execute();
    $stmt->close();

    $_SESSION['success_msg'] = "Thanks for signup with minicab services. One of our team member will contact you shortly.";
    header('Location: success-message.php');
    exit();
} else {
    $_SESSION['success_msg'] = "Error in Account Registration. Try Again Later!";
    header('Location: index.php');
    exit();
}

$connect->close();
?>
