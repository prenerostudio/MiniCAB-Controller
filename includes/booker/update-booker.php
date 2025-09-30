<?php
require '../../config.php';
include('../../session.php');

$c_id = $_POST['c_id'];
$cname = $_POST['cname'];
$cemail = $_POST['cemail'];
$cgender = $_POST['cgender'];
$caddress = $_POST['caddress'];
$clang = $_POST['clang'];
$pc = $_POST['pc'];
$cni = $_POST['cni'];
$com_name = $_POST['com_name'];
$com_type = $_POST['com_type'];
$percent = $_POST['percent'];
$fixed = $_POST['fixed'];

// Base update fields
$sql = "UPDATE `clients` SET 
            `c_name`='$cname',
            `c_email`='$cemail',
            `c_address`='$caddress',
            `c_gender`='$cgender',
            `c_language`='$clang',
            `postal_code`='$pc',
            `c_ni`='$cni',
            `company_name`='$com_name',
            `commission_type`='$com_type'";

// Add conditional commission fields
if ($com_type == 1) {
    $sql .= ", `percentage`='" . mysqli_real_escape_string($connect, $percent) . "', `fixed`=NULL";
} elseif ($com_type == 2) {
    $sql .= ", `fixed`='" . mysqli_real_escape_string($connect, $fixed) . "', `percentage`=NULL";
}

$sql .= " WHERE `c_id`='" . mysqli_real_escape_string($connect, $c_id) . "'";

$result = mysqli_query($connect, $sql);

if ($result) {	
    $activity_type = 'Booker Profile Updated';		
    $user_type = 'user';		
    $details = "Booker Profile " . $c_id . " Has Been Updated by Controller.";		
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
    mysqli_query($connect, $actsql);		
    header('location: ../../view-booker.php?c_id='.$c_id);    
    exit();    
} else {		
    header('location: ../../view-booker.php?c_id='.$c_id);    
}
$connect->close();
?>
