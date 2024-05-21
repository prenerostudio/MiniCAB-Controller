<?php
require 'config.php';

$d_id = $_POST['d_id'];
$dname = $_POST['dname'];
$demail = $_POST['demail'];
$dphone = $_POST['dphone'];
$dgender = $_POST['dgender'];
$daddress = $_POST['daddress'];
$dauth = $_POST['dauth'];
$dl = $_POST['dl'];
$dle = $_POST['dle'];
$pl = $_POST['pl'];
$ple = $_POST['ple'];
$dlang = $_POST['dlang'];
$sa = $_POST['sa'];
$dr = $_POST['dr'];

$sql = "UPDATE `drivers` SET  
							`d_name`='$dname',
							`d_email`='$demail',
							`d_phone`='$dphone',
							`d_address`='$daddress',
							`d_gender`='$dgender',
							`d_language`='$dlang',
							`licence_authority`='$dauth',
							`d_licence`='$dl',
							`d_licence_exp`='$dle',
							`pco_licence`='$pl',
							`pco_exp`='$ple',
							`skype_acount`='$sa',
							`d_remarks`='$dr' WHERE `d_id`='$d_id'";
        
$result = mysqli_query($connect, $sql);       
if ($result) {			
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Driver Profile Updated',											
											'Controller',											
											'Driver " . $d_name . " Profile Has Been updated by Controller.')";				
	$actr = mysqli_query($connect, $actsql);		             
	header('Location: view-driver.php?d_id='.$d_id);    
	exit();    
} else {           
	header('Location: view-driver.php?d_id='.$d_id);    
}
$connect->close();
?>
