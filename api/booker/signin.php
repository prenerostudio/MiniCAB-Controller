<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Initialize response array
$response = array();

if(isset($_POST['c_phone']) && isset($_POST['c_password'])){
    // Retrieve POST parameters
    $c_phone = trim($_POST['c_phone']);
    $c_password = trim($_POST['c_password']);

    // Validate that phone and password are not empty
    if (!empty($c_phone) && !empty($c_password)) {
        // Prevent SQL injection by using prepared statements
        $stmt = $connect->prepare("SELECT * FROM `clients` WHERE `c_phone` = ? AND `c_password` = ?");
        $stmt->bind_param("ss", $c_phone, $c_password);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $output = $result->fetch_assoc();
			
			 $c_id = $output['c_id'];

        // Generate a unique token
        $token = bin2hex(random_bytes(32));

        // Update the token in the database
        $updateTokenSql = "UPDATE `clients` SET `login_token`='$token' WHERE `c_id`='$c_id'";
        mysqli_query($connect, $updateTokenSql);
			
			
			

            // Log activity
            $activity_type = 'Booker Signed-In';
            $user_type = 'client';
            $details = "Booker recently logged-In.";
            $actstmt = $connect->prepare("INSERT INTO `activity_log` (
                `activity_type`, 
                `user_type`, 
                `user_id`, 
                `details`
            ) VALUES (?, ?, ?, ?)");
            $user_id = $output['c_id']; // Assuming 'c_id' is a column in 'clients' table
            $actstmt->bind_param("ssis", $activity_type, $user_type, $user_id, $details);
            $actstmt->execute();

            $response = array('data' => array('user' => $output, 'token' => $token), 'message' => 'User Logged in Successfully', 'status' => true);
        } else {
            $response = array('message' => 'Invalid Phone or Password!', 'status' => false);
        }
        
        $stmt->close();
    } else {
        $response = array('message' => 'Phone and Password are required', 'status' => false);
    }
} else {
    $response = array('message' => 'Some Fields are missing', 'status' => false);
}

// Output JSON response
echo json_encode($response);

// Close the database connection
$connect->close();
?>
