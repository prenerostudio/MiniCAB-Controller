<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Extract the token from the request headers or POST data
$token = $_POST['token']; // or use headers to get the token

if (isset($token)) {
    $sql = "SELECT * FROM `drivers` WHERE `login_token`='$token'";
    $r = mysqli_query($connect, $sql);

    if ($r && $r->num_rows > 0) {
        $output = $r->fetch_assoc();
        // Token is valid, proceed with the request

        // Example response
        echo json_encode(array('data' => $output, 'message' => 'Session is active', 'status' => true));
    } else {
        echo json_encode(array('message' => 'Invalid Token', 'status' => false));
    }
} else {
    echo json_encode(array('message' => 'Token Missing', 'status' => false));
}
?>
