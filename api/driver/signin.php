<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (isset($_POST['d_phone'])) {

	$d_phone = $_POST['d_phone'];

    // Using prepared statements to prevent SQL injection
    $stmt = $connect->prepare("SELECT * FROM drivers WHERE d_phone = ?");
    $stmt->bind_param("s", $d_phone);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();

    if ($result->num_rows > 0) {
        // Phone number exists, now check the account status
        $driver = $result->fetch_assoc();
        $account_status = $driver['acount_status'];

        if ($account_status == 1) {
            // Account status is 1, meaning the driver is logged in successfully
            echo json_encode(array('data' => $driver, 'status' => true, 'message' => "Driver Logged-in Successfully"));
        } else {
            // Account status is not 1, meaning the driver account is not active
            echo json_encode(array('message' => 'User Account is not active, Please Contact to admin for approval!', 'status' => false));
        }
    } else {
        // Phone number does not exist
        echo json_encode(array('message' => 'User Does Not Exist', 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
