<?php
ob_start();
include('../../configuration.php');
include('../../session.php');
header('Content-Type: application/json');
error_reporting(0); // hide warnings that can break JSON

// Ensure session started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Sanitize input
$from      = mysqli_real_escape_string($connect, $_POST['from']);
$to        = mysqli_real_escape_string($connect, $_POST['to']);
$salon     = mysqli_real_escape_string($connect, $_POST['salon']);
$estate    = mysqli_real_escape_string($connect, $_POST['estate']);
$mpv       = mysqli_real_escape_string($connect, $_POST['mpv']);
$esalon    = mysqli_real_escape_string($connect, $_POST['esalon']);
$lmpv      = mysqli_real_escape_string($connect, $_POST['lmpv']);
$empv      = mysqli_real_escape_string($connect, $_POST['empv']);
$minibus   = mysqli_real_escape_string($connect, $_POST['minibus']);
$delivery  = mysqli_real_escape_string($connect, $_POST['delivery']);

// Logged-in user ID (fallback)
$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : (isset($myId) ? $myId : 0);

// Vehicle mappings
$vehicle_prices = [
    1 => $salon,    // Salon
    2 => $estate,   // Estate
    3 => $mpv,      // MPV
    4 => $esalon,   // Executive Salon
    5 => $lmpv,     // Large MPV
    6 => $empv,     // Executive Large MPV
    7 => $minibus,  // MiniBus
    8 => $delivery  // Parcel Courier / Delivery
];

// Check if range already exists
$check_sql = "SELECT COUNT(*) AS total FROM vehicle_pricing_miles WHERE from_miles='$from' AND to_miles='$to'";
$check_result = mysqli_query($connect, $check_sql);
$row = mysqli_fetch_assoc($check_result);

if ($row['total'] > 0) {
    echo json_encode(['status' => 'error', 'message' => 'Mileage range already exists!']);
    exit;
}

// Insert all vehicle prices
$success = true;
foreach ($vehicle_prices as $v_id => $price) {
    $sql = "INSERT INTO vehicle_pricing_miles (v_id, from_miles, to_miles, price_per_mile)
            VALUES ('$v_id', '$from', '$to', '$price')";
    if (!mysqli_query($connect, $sql)) {
        $success = false;
    }
}

// Log activity if success
if ($success) {
    $activity_type = 'Price Per Miles Added';
    $user_type = 'user';
    $details = "Added new pricing for mileage range: $from - $to miles";

    $stmt = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssis", $activity_type, $user_type, $user_id, $details);
    $stmt->execute();
}

// Final JSON response
if ($success) {
    echo json_encode(['status' => 'success', 'message' => 'Pricing saved and logged successfully!']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Database insert failed!']);
}

exit;
?>
