<?php
session_start();

// Redirect if user is not logged in
if (!isset($_SESSION['email'])) {
    $_SESSION['msg'] = "You must log in first";
    header('Location: index.php');
    exit();
}

// ======================
// USER INFORMATION
// ======================
$myId          = $_SESSION['user_id'] ?? null;
$email         = $_SESSION['email'] ?? null;
$first_name    = $_SESSION['first_name'] ?? '';
$last_name     = $_SESSION['last_name'] ?? '';
$user_phone    = $_SESSION['user_phone'] ?? '';
$user_pic      = $_SESSION['user_pic'] ?? '';
$designation   = $_SESSION['designation'] ?? '';


// ======================
// BOOKINGS
// ======================
$add_booking         = $_SESSION['add_booking'] ?? '';
$open_booking        = $_SESSION['open_booking'] ?? '';
$all_booking         = $_SESSION['all_booking'] ?? '';
$upcoming_booking    = $_SESSION['upcoming_booking'] ?? '';
$inprocess_booking   = $_SESSION['inprocess_booking'] ?? '';
$completed_booking   = $_SESSION['completed_booking'] ?? '';
$cancelled_booking   = $_SESSION['cancelled_booking'] ?? '';


// ======================
// TIMESLOTS
// ======================
$available_timeslot  = $_SESSION['available_timeslot'] ?? '';
$waiting_timeslot    = $_SESSION['waiting_timeslot'] ?? '';
$accepted_timeslot   = $_SESSION['accepted_timeslot'] ?? '';
$cancelled_timeslot  = $_SESSION['cancelled_timeslot'] ?? '';
$withdrawn_timeslot  = $_SESSION['withdrawn_timeslot'] ?? '';
$completed_timeslot  = $_SESSION['completed_timeslot'] ?? '';


// ======================
// BIDS
// ======================
$new_bid        = $_SESSION['new_bid'] ?? '';
$bid_booking    = $_SESSION['bid_booking'] ?? '';
$accepted_bids  = $_SESSION['accepted_bids'] ?? '';


// ======================
// COMPANIES
// ======================
$active_companies   = $_SESSION['active_companies'] ?? '';
$blocked_companies  = $_SESSION['blocked_companies'] ?? '';
$deleted_companies  = $_SESSION['deleted_companies'] ?? '';
$company_profile    = $_SESSION['company_profile'] ?? '';


// ======================
// CUSTOMERS / ACCOUNTS
// ======================
$customer_accounts  = $_SESSION['customer_accounts'] ?? '';
$booker_accounts    = $_SESSION['booker_accounts'] ?? '';
$deleted_accounts   = $_SESSION['deleted_accounts'] ?? '';


// ======================
// DRIVERS
// ======================
$web_driver       = $_SESSION['web_driver'] ?? '';
$new_driver       = $_SESSION['new_driver'] ?? '';
$active_driver    = $_SESSION['active_driver'] ?? '';
$inactive_driver  = $_SESSION['inactive_driver'] ?? '';
$old_driver       = $_SESSION['old_driver'] ?? '';
$deleted_drivers  = $_SESSION['deleted_drivers'] ?? '';
$driver_tracker   = $_SESSION['driver_tracker'] ?? '';


// ======================
// DESTINATIONS / LOCATIONS
// ======================
$zones_list         = $_SESSION['zones_list'] ?? '';
$airports_list      = $_SESSION['airports_list'] ?? '';
$destinations_list  = $_SESSION['destinations_list'] ?? '';
$railways_list      = $_SESSION['railways_list'] ?? '';


// ======================
// VEHICLES / PRICING
// ======================
$vehicles_list   = $_SESSION['vehicles_list'] ?? '';
$pricing_models  = $_SESSION['pricing_models'] ?? '';
$fare_corrections = $_SESSION['fare_corrections'] ?? '';


// ======================
// REPORTS
// ======================
$driver_reports   = $_SESSION['driver_reports'] ?? '';
$customer_reports = $_SESSION['customer_reports'] ?? '';
$booker_reports   = $_SESSION['booker_reports'] ?? '';


// ======================
// OTHER
// ======================
$activity_logs   = $_SESSION['activity_logs'] ?? '';
$all_users_list  = $_SESSION['all_users_list'] ?? '';

?>
