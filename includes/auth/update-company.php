<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

$company_id = $_POST['company_id'];
$stmt = $connect->prepare("UPDATE company SET com_name=?, com_phone=?, com_c_email=?, com_a_email=?, com_a_phone=?, com_web=?, com_licence=?, com_vat=?, com_r_num=?, com_tax=?, com_address=?, com_zip=?, com_city=?, com_country=?, com_language=?, com_currency=?, com_time_zone=? WHERE company_id=?");
$stmt->bind_param("sssssssssssssssssi", $_POST['cname'], $_POST['cphone'], $_POST['cemail'], $_POST['aemail'], $_POST['aphone'], $_POST['cweb'], $_POST['clicence'], $_POST['cvat'], $_POST['cnum'], $_POST['ctax'], $_POST['caddress'], $_POST['czip'], $_POST['city'], $_POST['country'], $_POST['clang'], $_POST['currency'], $_POST['time_zone'], $company_id);
if ($stmt->execute()) {
    $activity_type = 'Company Info Updated';
    $user_type = 'user';
    $details = "Company Info ".$_POST['cname']." has been updated.";
    $log = $connect->prepare("INSERT INTO activity_log (activity_type,user_type,user_id,details) VALUES (?,?,?,?)");
    $log->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $log->execute();
    echo json_encode(['status'=>'success','message'=>'Company updated successfully']);
} else {
    echo json_encode(['status'=>'error','message'=>'Update failed']);
}
