<?php
// get_customer_phone.php

include('config.php');
// Check if the client ID is set in the POST request
if (isset($_POST['c_id'])) {
    $clientID = $_POST['c_id'];

    // Perform a query to get the customer details based on the client ID
    $query = "SELECT * FROM clients WHERE c_id = '$clientID'";
    $result = mysqli_query($connect, $query);

    if ($result) {
        // Fetch the phone number and email
        $row = mysqli_fetch_assoc($result);
        $customerPhone = $row['c_phone'];
        $customerEmail = $row['c_email'];

        // Return the phone number and email as a JSON response
        $response = array('phone' => $customerPhone, 'email' => $customerEmail);
        echo json_encode($response);
    } else {
        // Handle the error if the query fails
        echo "Error in query: " . mysqli_error($connect);
    }
} else {
    // Handle the case where the client ID is not set
    echo "Client ID not set.";
}

// Close the database connection
mysqli_close($connect);
?>