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
?>