<?php
if ($_SERVER['SERVER_NAME'] == 'localhost') {
	$localhost = "localhost";
	$username = "root";
	$password = "";
	$dbname = "minicab";
} else { 
	$localhost = "localhost";
	$username = "euroqzwc_prenero";
	$password = "Prenero1102/*";
	$dbname = "euroqzwc_minicaboffice";
}

$connect = new mysqli($localhost, $username, $password, $dbname);
date_default_timezone_set('Asia/Karachi');

if($connect->connect_error) {
	die("Connection Failed : " . $connect->connect_error);
} else {
}

// Enable error logging
ini_set("log_errors", 1); // Turn on error logging

// Specify the log file path
ini_set("error_log", "error.log");

// Optional: Disable display of errors on the screen for production
ini_set("display_errors", "off");

// You can also set the error reporting level (e.g., to log all errors, warnings, and notices)
error_reporting(E_ALL);
?>