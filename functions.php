<?php
session_start();
include('config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login_user'])) {
    $email = mysqli_real_escape_string($connect, $_POST['email']);
    $password = $_POST['password'];

    // Fetch user by email
    $query = "SELECT * FROM `users` WHERE `user_email` = ?";
    $stmt = mysqli_prepare($connect, $query);
    mysqli_stmt_bind_param($stmt, "s", $email);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($result && mysqli_num_rows($result) === 1) {
        $user = mysqli_fetch_assoc($result);

        // ✅ Use password_verify instead of md5
        if (password_verify($password, $user['user_password'])) {
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['email'] = $user['user_email'];

            // Fetch detailed user data including permissions
            $sql = "SELECT users.*, countries.*, user_page_access.* 
                    FROM users 
                    JOIN countries ON users.country_id = countries.country_id 
                    JOIN user_page_access ON user_page_access.user_id = users.user_id 
                    WHERE users.user_id = ?";
            $stmt = mysqli_prepare($connect, $sql);
            mysqli_stmt_bind_param($stmt, "i", $_SESSION['user_id']);
            mysqli_stmt_execute($stmt);
            $user_data = mysqli_stmt_get_result($stmt);
            $urow = mysqli_fetch_assoc($user_data);

            if ($urow) {
                $_SESSION['first_name'] = $urow['first_name'];
                $_SESSION['last_name'] = $urow['last_name'];
                $_SESSION['user_phone'] = $urow['user_phone'];
                $_SESSION['user_pic'] = $urow['user_pic'];
                $_SESSION['designation'] = $urow['designation'];
                // Assign all access permissions
                $permission_fields = [
                    'add_booking', 'open_booking', 'all_booking', 'upcoming_booking', 'inprocess_booking', 
                    'completed_booking', 'cancelled_booking', 'available_timeslot', 'waiting_timeslot', 
                    'accepted_timeslot', 'cancelled_timeslot', 'withdrawn_timeslot', 'completed_timeslot', 
                    'new_bid', 'bid_booking', 'accepted_bids', 'active_companies', 'blocked_companies', 
                    'deleted_companies', 'customer_accounts', 'booker_accounts', 'deleted_accounts', 
                    'web_driver', 'new_driver', 'active_driver', 'inactive_driver', 'old_driver', 
                    'deleted_drivers', 'zones_list', 'airports_list', 'destinations_list', 'railways_list', 
                    'company_profile', 'vehicles_list', 'pricing_models', 'driver_reports', 
                    'customer_reports', 'booker_reports', 'activity_logs'
                ];

                foreach ($permission_fields as $field) {
                    $_SESSION[$field] = $urow[$field];
                }

                $_SESSION['full_name'] = $urow['first_name'] . " " . $urow['last_name'];
                $_SESSION['success'] = "You are now logged in";

                // Log activity
                $activity_type = 'Controller Logged-In';
                $user_type = 'user';
                $details = "Controller " . $_SESSION['first_name'] . " logged in successfully.";
                $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";
                $stmt = mysqli_prepare($connect, $actsql);
                mysqli_stmt_bind_param($stmt, "ssis", $activity_type, $user_type, $_SESSION['user_id'], $details);
                mysqli_stmt_execute($stmt);

                header('Location: dashboard.php');
                exit;
            }
        } else {
            // Invalid password
            header('Location: index.php?error=InvalidCredentials');
            exit;
        }
    } else {
        // User not found
        header('Location: index.php?error=UserNotFound');
        exit;
    }
} else {
    die('Invalid request.');
}


if (isset($_POST['create_user'])) {
	$fname = $_POST['fname'];

	$lname = $_POST['lname'];

	$uemail = $_POST['uemail'];

	$upass = password_hash($_POST['upass'], PASSWORD_DEFAULT); // ✅ Secure password hash

	$uphone = $_POST['uphone'];

	$udesig = 'Super-admin';

	$country_id = $_POST['country_id'];



	// Check if email already exists

	$emailCheckSql = "SELECT * FROM `users` WHERE `user_email` = '$uemail'";

	$emailCheckResult = mysqli_query($connect, $emailCheckSql);


	if (mysqli_num_rows($emailCheckResult) > 0) {

		header('location: all-users.php?error=EmailAlreadyExists');
    
		exit();

	}


	// Insert user into database
    

	$sql = "INSERT INTO `users`(
                `first_name`, 
                `last_name`, 
                `user_email`, 
                `user_password`, 
                `user_phone`,                 
                `designation`,                
                `country_id`,              
                `reg_date`
            ) VALUES (
                '$fname',
                '$lname',
                '$uemail',
                '$upass',
                '$uphone',                
                '$udesig',                
                '$country_id',              
                NOW())";


$result = mysqli_query($connect, $sql);

if ($result) {
    $user_id = mysqli_insert_id($connect);

    $per_sql = "INSERT INTO `user_page_access`(`user_id`) VALUES ('$user_id')";
    $perr = mysqli_query($connect, $per_sql);

    $activity_type = 'New Admin Added';
    $user_type = 'user';
    $details = "New Admin " . $fname . " has been added by Controller.";

    $actsql = "INSERT INTO `activity_log`(
                    `activity_type`, 
                    `user_type`, 
                    `user_id`, 
                    `details`
                ) VALUES (
                    '$activity_type',
                    '$user_type',
                    '$myId',
                    '$details')";
    $actr = mysqli_query($connect, $actsql);

    header('location: index.php');
    exit();
} else {
    header('location: index.php?error=InsertFailed');
    exit();
}

} else {
    die('Invalid request.');
}



?>
