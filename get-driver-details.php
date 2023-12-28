<?php
// get_customer_phone.php

include('config.php');
// Check if the client ID is set in the POST request
if (isset($_POST['d_id'])) {
    $DriverId = $_POST['d_id'];

    // Perform a query to get the customer details based on the client ID
    $query = "SELECT * FROM `drivers` WHERE `d_id`= '$DriverId'";
    $result = mysqli_query($connect, $query);

    if ($result) {
        // Fetch the phone number and email
        $row = mysqli_fetch_assoc($result);
        $driverPhone = $row['d_phone'];
        $driverEmail = $row['d_email'];

        // Return the phone number and email as a JSON response
        $response = array('phone' => $driverPhone, 'email' => $driverEmail);
        echo json_encode($response);
    } else {
        // Handle the error if the query fails
        echo "Error in query: " . mysqli_error($connect);
    }
} else {
    // Handle the case where the client ID is not set
    echo "driver ID not set.";
}

// Close the database connection
mysqli_close($connect);
?>