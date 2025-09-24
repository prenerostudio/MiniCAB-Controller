<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Check if required fields are set
if (isset($_POST['d_name'], $_POST['d_email'], $_POST['d_phone'], $_POST['d_password'])) {

    $d_name = $_POST['d_name'];
    $d_email = $_POST['d_email'];
    $d_phone = $_POST['d_phone'];
    $raw_password = $_POST['d_password'];
    $licence_authority = $_POST['licence_authority'];
    $acount_status = 0;

    $d_password = password_hash($raw_password, PASSWORD_DEFAULT);

    // Check if driver already exists
    $stmt = $connect->prepare("SELECT d_id FROM drivers WHERE d_phone = ?");
    $stmt->bind_param("s", $d_phone);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        echo json_encode(['message' => "This user already exists! Try to sign in.", 'status' => false]);
        $stmt->close();
        exit;
    }
    $stmt->close();

    // Insert new driver
    $stmt = $connect->prepare("INSERT INTO drivers (d_name, d_email, d_phone, d_password, licence_authority, acount_status) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssi", $d_name, $d_email, $d_phone, $d_password, $licence_authority, $acount_status);

    if ($stmt->execute()) {
        $d_id = $stmt->insert_id;
        
        $vsql = "INSERT INTO `driver_vehicle`(`d_id`) VALUES ('$d_id')";
        
			
        $vr = mysqli_query($connect, $vsql);
        
        
        $stmt->close();
      
        // Log activity
        $activity_type = 'New Driver Profile Registered';
        $user_type = 'driver';
        $details = "New Driver Account Created by $d_name";

        $stmt = $connect->prepare("INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssis", $activity_type, $user_type, $d_id, $details);
        $stmt->execute();
        $stmt->close();

        echo json_encode(['data' => $d_id, 'message' => "Driver registered successfully", 'status' => true]);

    } else {
        echo json_encode(['message' => "Error in registering driver", 'status' => false]);
    }

} else {
    echo json_encode(['message' => "Some fields are missing", 'status' => false]);
}
?>
