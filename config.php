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
date_default_timezone_set('Europe/London');
if($connect->connect_error) {
	die("Connection Failed : " . $connect->connect_error);
} else {
}
ini_set("log_errors", 1); 
ini_set("error_log", "error.log");
ini_set("display_errors", "off");
error_reporting(E_ALL);
?>