<?php
include('../../configuration.php');
include('../../session.php');

header("Content-Type: application/json; charset=UTF-8");

if(!isset($_POST['v_id'])){
    echo json_encode(["status"=>"error","message"=>"Vehicle ID missing"]);
    exit;
}

$v_id = mysqli_real_escape_string($connect, $_POST['v_id']);

// Optional: get vehicle name for logging
$fetch = mysqli_query($connect, "SELECT v_name FROM vehicles WHERE v_id='$v_id'");
$data = mysqli_fetch_assoc($fetch);
$vname = $data['v_name'] ?? '';

// Delete vehicle
$sql = "DELETE FROM vehicles WHERE v_id='$v_id'";
$result = mysqli_query($connect, $sql);

if($result){
    // Activity log
    $activity_type = 'Vehicle Deleted';
    $user_type = 'user';
    $details = "Vehicle '$vname' has been deleted by Controller.";

    $stmt = $connect->prepare("INSERT INTO activity_log(activity_type,user_type,user_id,details) VALUES(?,?,?,?)");
    $stmt->bind_param("ssis", $activity_type, $user_type, $myId, $details);
    $stmt->execute();
    $stmt->close();

    echo json_encode(["status"=>"success","message"=>"Vehicle deleted successfully!"]);
} else {
    echo json_encode(["status"=>"error","message"=>"Failed to delete vehicle"]);
}
exit;
?>
