<?php
require 'config.php';
include('session.php');

$user_id = $_POST['user_id'];

$add_booking = $_POST['add-booking'];
$open_bookings = $_POST['view-open-bookings'];
$all_bookings = $_POST['manage-all-bookings'];
$upcoming_bookings = $_POST['view-upcoming-bookings'];
$inprocess_bookings = $_POST['modify-inprocess-bookings'];
$completed_bookings = $_POST['view-completed-bookings'];
$cancelled_bookings = $_POST['manage-cancelled-bookings'];
$available_timeslot = $_POST['create-available-timeslot'];
$waiting_timeslot = $_POST['monitor-waiting-timeslot'];
$accepted_timeslot = $_POST['confirm-accepted-timeslot'];
$cancelled_timeslot = $_POST['process-cancelled-timeslot'];
$withdrawn_timeslot = $_POST['track-withdrawn-timeslot'];
$completed_timeslot = $_POST['archive-completed-timeslot'];
$new_bid = $_POST['initiate-new-bid'];
$bid_bookings = $_POST['manage-bid-bookings'];
$accepted_bids = $_POST['finalize-accepted-bids'];
$active_companies = $_POST['access-active-companies'];
$blocked_companies = $_POST['manage-blocked-companies'];
$deleted_companies = $_POST['execute-company-deletion'];
$customer_accounts = $_POST['manage-customer-accounts'];
$booker_accounts = $_POST['control-booker-accounts'];
$account_deletion = $_POST['perform-account-deletion'];
$zones = $_POST['configure-zones'];
$airports = $_POST['manage-airports'];
$destinations = $_POST['maintain-destinations'];
$railway_stations = $_POST['administer-railway-stations'];
$web_drivers = $_POST['import-web-drivers'];
$new_drivers = $_POST['onboard-new-drivers'];
$active_drivers = $_POST['monitor-active-drivers'];
$inactive_drivers = $_POST['review-inactive-drivers'];
$old_drivers = $_POST['archive-old-drivers'];
$driver_records = $_POST['remove-driver-records'];
$company_profile = $_POST['edit-company-profile'];
$vehicle_registry = $_POST['maintain-vehicle-registry'];
$pricing_models = $_POST['adjust-pricing-models'];
$driver_reports = $_POST['generate-driver-reports'];
$customer_reports = $_POST['export-customer-reports'];
$booker_analytics = $_POST['access-booker-analytics'];
$activity_logs = $_POST['audit-activity-logs'];
	
	
$sql = "UPDATE `user_page_access` SET 
							`add_booking`='$add_booking',
							`open_booking`='$open_bookings',
							`all_booking`='$all_bookings',
							`upcoming_booking`='$upcoming_bookings',
							`inprocess_booking`='$inprocess_bookings',
							`completed_booking`='$completed_bookings',
							`cancelled_booking`='$cancelled_bookings',
							`available_timeslot`='$available_timeslot',
							`waiting_timeslot`='$waiting_timeslot',
							`accepted_timeslot`='$accepted_timeslot',
							`cancelled_timeslot`='$cancelled_timeslot',
							`withdrawn_timeslot`='$withdrawn_timeslot',
							`completed_timeslot`='$completed_timeslot',
							`new_bid`='$new_bid',
							`bid_booking`='$bid_bookings',
							`accepted_bids`='$accepted_bids',
							`active_companies`='$active_companies',
							`blocked_companies`='$blocked_companies',
							`deleted_companies`='$deleted_companies',
							`customer_accounts`='$customer_accounts',
							`booker_accounts`='$booker_accounts',
							`deleted_accounts`='$account_deletion',
							`web_driver`='$web_drivers',
							`new_driver`='$new_drivers',
							`active_driver`='$active_drivers',
							`inactive_driver`='$inactive_drivers',
							`old_driver`='$old_drivers',
							`deleted_drivers`='$driver_records',
							`zones_list`='$zones',
							`airports_list`='$airports',
							`destinations_list`='$destinations',
							`railways_list`='$railway_stations',
							`company_profile`='$company_profile',
							`vehicles_list`='$vehicle_registry',
							`pricing_models`='$pricing_models',
							`driver_reports`='$driver_reports',
							`customer_reports`='$customer_reports',
							`booker_reports`='$booker_analytics',
							`activity_logs`='$activity_logs' WHERE `user_id` = '$user_id'";
$result = mysqli_query($connect, $sql);       
if ($result) {
    $activity_type = 'Admin Updated User Permissions';	
    $user_type = 'user';
    $details = "User Permissions Has Been updated by Admin.";
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
    header('location: view-user.php?user_id='.$user_id);    
    exit();    
} else {           
    header('location: view-user.php?user_id='.$user_id);   
}
$connect->close();