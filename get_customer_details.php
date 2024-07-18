<?php
include('config.php');

if (isset($_POST['c_id']) && isset($_POST['b_type_id'])) {
    // Sanitize input to prevent SQL injection
    $clientID = mysqli_real_escape_string($connect, $_POST['c_id']);
    $bookingTypeID = mysqli_real_escape_string($connect, $_POST['b_type_id']);
    
    // Determine the table and columns to query based on booking type
    if ($bookingTypeID == '2') {
        // Fetch company account details
        $query = "SELECT com_phone AS phone, com_email AS email FROM `companies` WHERE com_id = '$clientID'";
    } else {
        // Fetch client details
        $query = "SELECT c_phone AS phone, c_email AS email FROM clients WHERE c_id = '$clientID'";
    }
    
    $result = mysqli_query($connect, $query);

    if ($result) {
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            $response = array('phone' => $row['phone'], 'email' => $row['email']);
            echo json_encode($response);
        } else {
            echo json_encode(array('error' => 'No details found for the given ID.'));
        }
    } else {
        echo json_encode(array('error' => 'Error in query: ' . mysqli_error($connect)));
    }
} else {
    echo json_encode(array('error' => 'Client ID or Booking Type ID not set.'));
}

mysqli_close($connect);
?>
