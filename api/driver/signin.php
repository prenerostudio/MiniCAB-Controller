<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_phone    = $_POST['d_phone'] ?? '';
$d_password = $_POST['d_password'] ?? '';

if (!empty($d_phone) && !empty($d_password)) {

    // Fetch user by phone
    $stmt = $connect->prepare("SELECT * FROM `drivers` WHERE `d_phone` = ?");
    $stmt->bind_param("s", $d_phone);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Verify password
        if (password_verify($d_password, $user['d_password'])) {
            $d_id = $user['d_id'];
            $token = bin2hex(random_bytes(32)); // Secure token

            // Update token in DB
            $updateStmt = $connect->prepare("UPDATE `drivers` SET `login_token` = ? WHERE `d_id` = ?");
            $updateStmt->bind_param("si", $token, $d_id);
            $updateStmt->execute();
            $updateStmt->close();

            // Log activity
            $activity_type = 'Account Logged In';
            $user_type = 'driver';
            $details = 'You have logged in to your account.';

            $logStmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
            $logStmt->bind_param("ssis", $activity_type, $user_type, $d_id, $details);
            $logStmt->execute();
            $logStmt->close();

            unset($user['d_password']); // Don’t expose password hash

            echo json_encode([
                'data' => ['user' => $user, 'token' => $token],
                'message' => 'User Logged in Successfully',
                'status' => true
            ]);
        } else {
            echo json_encode(['message' => 'Incorrect password', 'status' => false]);
        }
    } else {
        echo json_encode(['message' => 'User does not exist', 'status' => false]);
    }

    $stmt->close();
} else {
    echo json_encode(['message' => 'Some fields are missing', 'status' => false]);
}

$connect->close();
?>
