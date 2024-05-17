<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Check if d_id is provided
if(isset($_POST['d_id'])) { 
    $d_id = $_POST['d_id'];
    $date = date("Y-m-d h:i:s");

    // Insert break time
    $insert_break_query = "INSERT INTO `break_time` (`d_id`, `start_time`) VALUES ('$d_id', '$date')";
    $insert_break_result = mysqli_query($connect, $insert_break_query);

    // Update driver status
    $update_driver_query = "UPDATE `drivers` SET `status`='On-Break' WHERE `d_id`='$d_id'";
    $update_driver_result = mysqli_query($connect, $update_driver_query);

    // Check if both operations were successful
    if($insert_break_result && $update_driver_result) {   
        $break_id = mysqli_insert_id($connect);
        echo json_encode(array('data' => $break_id, 'message' => "Driver is On Break", 'status' => true));
    } else {    
        echo json_encode(array('message' => "Error in logging break time", 'status' => false));
    }	       
} else {   
    echo json_encode(array('message' => "Some fields are missing", 'status' => false));
}
?>
