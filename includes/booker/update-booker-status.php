<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

$c_id = $_POST['c_id'] ?? null;

if(!$c_id){
    echo json_encode(['status'=>'error','message'=>'Invalid request.']);
    exit();
}

$status = 1;

$sql = "UPDATE `clients` SET `acount_status`=? WHERE `c_id`=?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("ii", $status, $c_id);

if($stmt->execute()){
    $activity_type = 'Booker Verified';
    $user_type = 'user';
    $details = "Booker $c_id has been verified by Controller.";

    mysqli_query($connect, "INSERT INTO `activity_log`(`activity_type`,`user_type`,`user_id`,`details`) 
                            VALUES ('$activity_type','$user_type','$myId','$details')");

    echo json_encode(['status'=>'success','message'=>'Booker has been approved successfully.']);
}else{
    echo json_encode(['status'=>'error','message'=>'Failed to approve booker.']);
}

$stmt->close();
$connect->close();
exit();
?>
