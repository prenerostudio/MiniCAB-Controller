<?php
include('config.php');
include('session.php');

$company_id = $_POST['company_id'];
$cname = $_POST['cname'];
$cphone = $_POST['cphone'];
$cemail = $_POST['cemail'];
$aemail = $_POST['aemail'];
$aphone = $_POST['aphone'];
$cweb = $_POST['cweb'];
$clicence = $_POST['clicence'];
$cvat = $_POST['cvat'];
$cnum = $_POST['cnum'];
$ctax = $_POST['ctax'];
$caddress = $_POST['caddress'];
$czip = $_POST['czip'];
$city = $_POST['city'];
$country = $_POST['country'];
$clang = $_POST['clang'];
$currency = $_POST['currency'];
$time_zone = $_POST['time_zone'];



$sql = "UPDATE `company` SET 
			`com_name`='$cname',
			`com_phone`='$cphone',
			`com_c_email`='$cemail',
			`com_a_email`='$aemail',
			`com_a_phone`='$aphone',
			`com_web`='$cweb',
			`com_licence`='$clicence',
			`com_vat`='$cvat',
			`com_r_num`='$cnum',
			`com_tax`='$ctax',
			`com_address`='$caddress',
			`com_zip`='$czip',
			`com_city`='$city',
			`com_country`='$country',
			`com_language`='$clang',
			`com_currency`='$currency',
			`com_time_zone`='$time_zone' WHERE `company_id`='$company_id'";
        

$result = mysqli_query($connect, $sql);       

if ($result) {

    $activity_type = 'Company Info Updated';

    $user_type = 'user';

    $details = "Company Info " . $cname . " Has Been Updated.";

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

    header('location: company.php');    

    exit();    

    
} else {           

    header('location: company.php');    
}
$connect->close();

	
?>