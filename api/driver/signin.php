<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_phone = $_POST['d_phone'];
$d_password = $_POST['d_password'];

if (isset($_POST['d_phone'])) {
    $sql = "SELECT * FROM `drivers` WHERE `d_phone`='$d_phone' AND `d_password`='$d_password'";
    $r = mysqli_query($connect, $sql);

    if ($r && $r->num_rows > 0) {
        $output = $r->fetch_assoc();
        $d_id = $output['d_id'];

        // Generate a unique token
        $token = bin2hex(random_bytes(32));

        // Update the token in the database
        $updateTokenSql = "UPDATE `drivers` SET `login_token`='$token' WHERE `d_id`='$d_id'";
        mysqli_query($connect, $updateTokenSql);

        // Log the activity
        $activity_type = 'Account Logged In';
        $user_type = 'driver';
        $details = "You have logged in to your account.";
        $actsql = "INSERT INTO `activity_log`(
                            `activity_type`, 
                            `user_type`, 
                            `user_id`, 
                            `details`
                            ) VALUES (
                            '$activity_type',
                            '$user_type',
                            '$d_id',
                            '$details'
                            )";		
        mysqli_query($connect, $actsql);

        // Respond with the token
        echo json_encode(array('data' => array('user' => $output, 'token' => $token), 'message' => 'User Logged in Successfully', 'status' => true));
    } else {
        echo json_encode(array('message' => 'User Does Not Exist', 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
