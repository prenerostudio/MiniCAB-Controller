<?php
session_start();
include('config.php');
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login_user'])) {    
	$email = mysqli_real_escape_string($connect, $_POST['email']);    
	$password = md5($_POST['password']);        
	$query = "SELECT * FROM `users` WHERE `user_email` = ? AND `user_password` = ?";    
	$stmt = mysqli_prepare($connect, $query);    
	mysqli_stmt_bind_param($stmt, "ss", $email, $password);    
	mysqli_stmt_execute($stmt);    
	$result = mysqli_stmt_get_result($stmt);        
	if ($result && mysqli_num_rows($result) === 1) {    
		$user = mysqli_fetch_assoc($result);        
		$_SESSION['user_id'] = $user['user_id'];        
		$_SESSION['email'] = $user['user_email'];        		        
		$sql = "SELECT users.*, countries.*, user_page_access.* FROM users JOIN countries ON users.country_id = countries.country_id JOIN user_page_access ON user_page_access.user_id = users.user_id WHERE users.user_id = ?";        
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
			$_SESSION['add_booking'] = $urow['add_booking'];			
			$_SESSION['open_booking'] = $urow['open_booking']; 
			$_SESSION['all_booking'] = $urow['all_booking']; 
			$_SESSION['upcoming_booking'] = $urow['upcoming_booking']; 
			$_SESSION['inprocess_booking'] = $urow['inprocess_booking']; 
			$_SESSION['completed_booking'] = $urow['completed_booking']; 
			$_SESSION['cancelled_booking'] = $urow['cancelled_booking']; 
			$_SESSION['available_timeslot'] = $urow['available_timeslot']; 
			$_SESSION['waiting_timeslot'] = $urow['waiting_timeslot']; 
			$_SESSION['accepted_timeslot'] = $urow['accepted_timeslot']; 
			$_SESSION['cancelled_timeslot'] = $urow['cancelled_timeslot']; 
			$_SESSION['withdrawn_timeslot'] = $urow['withdrawn_timeslot']; 
			$_SESSION['completed_timeslot'] = $urow['completed_timeslot']; 
			$_SESSION['new_bid'] = $urow['new_bid']; 
			$_SESSION['bid_booking'] = $urow['bid_booking']; 
			$_SESSION['accepted_bids'] = $urow['accepted_bids']; 
			$_SESSION['active_companies'] = $urow['active_companies']; 
			$_SESSION['blocked_companies'] = $urow['blocked_companies']; 
			$_SESSION['deleted_companies'] = $urow['deleted_companies']; 
			$_SESSION['customer_accounts'] = $urow['customer_accounts']; 
			$_SESSION['booker_accounts'] = $urow['booker_accounts']; 
			$_SESSION['deleted_accounts'] = $urow['deleted_accounts']; 
			$_SESSION['web_driver'] = $urow['web_driver']; 
			$_SESSION['new_driver'] = $urow['new_driver']; 
			$_SESSION['active_driver'] = $urow['active_driver']; 
			$_SESSION['inactive_driver'] = $urow['inactive_driver']; 
			$_SESSION['old_driver'] = $urow['old_driver']; 
			$_SESSION['deleted_drivers'] = $urow['deleted_drivers']; 
			$_SESSION['zones_list'] = $urow['zones_list']; 
			$_SESSION['airports_list'] = $urow['airports_list']; 
			$_SESSION['destinations_list'] = $urow['destinations_list']; 
			$_SESSION['railways_list'] = $urow['railways_list']; 
			$_SESSION['company_profile'] = $urow['company_profile']; 
			$_SESSION['vehicles_list'] = $urow['vehicles_list']; 
			$_SESSION['pricing_models'] = $urow['pricing_models']; 
			$_SESSION['driver_reports'] = $urow['driver_reports']; 
			$_SESSION['customer_reports'] = $urow['customer_reports']; 
			$_SESSION['booker_reports'] = $urow['booker_reports']; 
			$_SESSION['activity_logs'] = $urow['activity_logs'];
			$_SESSION['full_name'] = $urow['first_name'] . " " . $urow['last_name'];            
			$_SESSION['success'] = "You are now logged in";        
		}                
		$activity_type = 'Controller Logged-In';        
		$user_type = 'user';        
		$details = "Controller " . $_SESSION['first_name'] . " logged in successfully.";        
		$actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";        
		$stmt = mysqli_prepare($connect, $actsql);        
		mysqli_stmt_bind_param($stmt, "ssis", $activity_type, $user_type, $_SESSION['user_id'], $details);
        mysqli_stmt_execute($stmt);        
        header('Location: dashboard.php');
        exit;
    } else {
        header('Location: index.php');
        exit;
    }
} else {
    die('Invalid request.');
}
?>