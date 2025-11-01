<?php
session_start();
require_once('../../configuration.php');

header('Content-Type: application/json');

function logActivity($connect, $activity_type, $user_type, $user_id, $details) {
    $stmt = mysqli_prepare($connect, "
        INSERT INTO activity_log (activity_type, user_type, user_id, details)
        VALUES (?, ?, ?, ?)
    ");
    mysqli_stmt_bind_param($stmt, "ssis", $activity_type, $user_type, $user_id, $details);
    mysqli_stmt_execute($stmt);
}

$email = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

if (empty($email) || empty($password)) {
    echo json_encode(['status' => 'error', 'message' => 'Please fill in both email and password.']);
    exit;
}

$stmt = mysqli_prepare($connect, "SELECT * FROM users WHERE user_email = ?");
mysqli_stmt_bind_param($stmt, "s", $email);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

if ($user = mysqli_fetch_assoc($result)) {
    if (password_verify($password, $user['user_password'])) {
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['email'] = $user['user_email'];

        $sql = "
            SELECT users.*, countries.*, user_page_access.*
            FROM users
            JOIN countries ON users.country_id = countries.country_id
            JOIN user_page_access ON user_page_access.user_id = users.user_id
            WHERE users.user_id = ?
        ";
        $stmt = mysqli_prepare($connect, $sql);
        mysqli_stmt_bind_param($stmt, "i", $user['user_id']);
        mysqli_stmt_execute($stmt);
        $user_data = mysqli_stmt_get_result($stmt);

        if ($urow = mysqli_fetch_assoc($user_data)) {
            $_SESSION['first_name'] = $urow['first_name'];
            $_SESSION['last_name'] = $urow['last_name'];
            $_SESSION['full_name'] = "{$urow['first_name']} {$urow['last_name']}";

            $permissions = [
                'add_booking', 'open_booking', 'all_booking', 'upcoming_booking',
                'inprocess_booking', 'completed_booking', 'cancelled_booking',
                'available_timeslot', 'waiting_timeslot', 'accepted_timeslot',
                'cancelled_timeslot', 'withdrawn_timeslot', 'completed_timeslot',
                'new_bid', 'bid_booking', 'accepted_bids', 'active_companies',
                'blocked_companies', 'deleted_companies', 'customer_accounts',
                'booker_accounts', 'deleted_accounts', 'web_driver', 'new_driver',
                'active_driver', 'inactive_driver', 'old_driver', 'deleted_drivers',
                'zones_list', 'airports_list', 'destinations_list', 'railways_list',
                'company_profile', 'vehicles_list', 'pricing_models', 'driver_reports',
                'customer_reports', 'booker_reports', 'activity_logs', 'driver_tracker', 
                'fare_corrections', 'all_users_list'
            ];
            foreach ($permissions as $perm) {
                $_SESSION[$perm] = $urow[$perm] ?? 0;
            }

            // Log login activity
            $details = "Controller {$urow['first_name']} logged in successfully.";
            logActivity($connect, 'Controller Logged-In', 'user', $urow['user_id'], $details);

            echo json_encode(['status' => 'success', 'message' => 'Login successful! Redirecting...']);
            exit;
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Invalid email or password.']);
        exit;
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'User not found.']);
    exit;
}
?>