<?php
require 'config.php';

$ap_id = $_POST['ap_id'];
$ap_name = $_POST['ap_name'];
$ap_address = $_POST['ap_address'];
$ap_city = $_POST['ap_city'];
$ap_code = $_POST['ap_code'];
$date = date("Y-m-d H:i:s");

$sql = "UPDATE `airports` SET 
							`ap_name`='$ap_name',
							`ap_address`='$ap_address',
							`ap_city`='$ap_city',
							`ap_code`='$ap_code',
							`ap_date_added`='$date' WHERE `ap_id`='$ap_id'";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: airports.php');    
	exit();    
} else {		
	header('Location: airports.php');    
}
$connect->close();
?>
