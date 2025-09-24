<?php
session_start();
require_once('../../config.php');

function redirectWithError($url, $error) {
    header("Location: $url?error=$error");
    exit();
}

function logActivity($connect, $activity_type, $user_type, $user_id, $details) {
    $stmt = mysqli_prepare($connect, "
        INSERT INTO activity_log (activity_type, user_type, user_id, details)
        VALUES (?, ?, ?, ?)
    ");
    mysqli_stmt_bind_param($stmt, "ssis", $activity_type, $user_type, $user_id, $details);
    mysqli_stmt_execute($stmt);
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die('Invalid request method.');
}

if (isset($_POST['create_user'])) {
    // CREATE USER
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $uemail = $_POST['uemail'];
    $upass = password_hash($_POST['upass'], PASSWORD_DEFAULT);
    $uphone = $_POST['uphone'];
    $udesig = 'Super-admin';
    $country_id = $_POST['country_id'];

    // Check if email already exists
    $stmt = mysqli_prepare($connect, "SELECT user_id FROM users WHERE user_email = ?");
    mysqli_stmt_bind_param($stmt, "s", $uemail);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_store_result($stmt);

    if (mysqli_stmt_num_rows($stmt) > 0) {
        redirectWithError('register-user.php', 'EmailAlreadyExists');
    }

    // Insert new user
    $sql = "
        INSERT INTO users (first_name, last_name, user_email, user_password, user_phone, designation, country_id, reg_date)
        VALUES (?, ?, ?, ?, ?, ?, ?, NOW())
    ";
    $stmt = mysqli_prepare($connect, $sql);
    mysqli_stmt_bind_param($stmt, "ssssssi", $fname, $lname, $uemail, $upass, $uphone, $udesig, $country_id);

    if (mysqli_stmt_execute($stmt)) {
        $user_id = mysqli_insert_id($connect);

        // Set default access
        $access_query = "
            INSERT INTO user_page_access (
                user_id, add_booking, open_booking, all_booking, upcoming_booking, inprocess_booking,
                completed_booking, cancelled_booking, available_timeslot, waiting_timeslot, accepted_timeslot,
                cancelled_timeslot, withdrawn_timeslot, completed_timeslot, new_bid, bid_booking, accepted_bids,
                active_companies, blocked_companies, deleted_companies, customer_accounts, booker_accounts,
                deleted_accounts, web_driver, new_driver, active_driver, inactive_driver, old_driver,
                deleted_drivers, zones_list, airports_list, destinations_list, railways_list, company_profile,
                vehicles_list, pricing_models, driver_reports, customer_reports, booker_reports, activity_logs, driver_tracker, fare_corrections, all_users_list
            ) VALUES (?, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
        ";
        $stmt = mysqli_prepare($connect, $access_query);
        mysqli_stmt_bind_param($stmt, "i", $user_id);
        mysqli_stmt_execute($stmt);

        // Log creation
        $creator_id = $_SESSION['user_id'] ?? 0;
        $details = "New Admin $fname has been added by Controller.";
        logActivity($connect, 'New Admin Added', 'user', $creator_id, $details);

        header('Location: ../../index.php');
        exit();
    } else {
        redirectWithError('../../index.php', 'InsertFailed');
    }

} elseif (isset($_POST['login_user'])) {
    // LOGIN USER
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    $stmt = mysqli_prepare($connect, "SELECT * FROM users WHERE user_email = ?");
    mysqli_stmt_bind_param($stmt, "s", $email);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($user = mysqli_fetch_assoc($result)) {
        if (password_verify($password, $user['user_password'])) {
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['email'] = $user['user_email'];

            // Load full user data
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
                $_SESSION['user_phone'] = $urow['user_phone'];
                $_SESSION['user_pic'] = $urow['user_pic'];
                $_SESSION['designation'] = $urow['designation'];
                $_SESSION['full_name'] = "{$urow['first_name']} {$urow['last_name']}";

                // Load permissions
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
                    'customer_reports', 'booker_reports', 'activity_logs', 'driver_tracker', 'fare_corrections', 'all_users_list'
                ];
                foreach ($permissions as $perm) {
                    $_SESSION[$perm] = $urow[$perm] ?? 0;
                }

                $_SESSION['success'] = "You are now logged in";

                // Log login
                $details = "Controller {$urow['first_name']} logged in successfully.";
                logActivity($connect, 'Controller Logged-In', 'user', $urow['user_id'], $details);

                header('Location: ../../dashboard.php');
                exit();
            }
        } else {
            redirectWithError('../../index.php', 'InvalidCredentials');
        }
    } else {
        redirectWithError('../../index.php', 'UserNotFound');
    }

} else {
    die('Unknown action.');
}
