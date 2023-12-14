<?php
// Assuming you have a database connection established in your main file (e.g., where the form is)
include("config.php"); // Include your database connection file
// Check if the driver ID is set in the request
if(isset($_GET['d_id'])) {
    // Sanitize the input to prevent SQL injection
    $selectedDriverId = mysqli_real_escape_string($connect, $_GET['d_id']);

    // Fetch the v_id and v_name of the selected driver from the drivers table
    $query = "SELECT d.v_id, v.v_name FROM drivers d
              INNER JOIN vehicles v ON d.v_id = v.v_id
              WHERE d.d_id = '$selectedDriverId'";
    $result = mysqli_query($connect, $query);

    if(mysqli_num_rows($result) > 0) {
        // Fetch the v_id and v_name from the result
        $row = mysqli_fetch_assoc($result);
        $vId = $row['v_id'];
        $vehicleName = $row['v_name'];

        // Return the v_id and v_name as the response, separated by a delimiter (you can adjust as needed)
        echo $vId . "|" . $vehicleName;
    } else {
        // If no matching record found
        echo "No vehicle information found for the selected driver.";
    }
} else {
    // If the driver ID is not set in the request, return an error message
    echo "Driver ID not provided.";
}

// Close the database connection
mysqli_close($connect);
?>
