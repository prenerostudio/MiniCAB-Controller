<?php
include('config.php');


// Get the booking ID from the AJAX request
if (isset($_GET['book_id'])) {
    $bookId = $_GET['book_id'];

    // Query your database to retrieve booking details
    $query = "SELECT bookings.*, clients.c_name, clients.c_email, clients.c_phone, vehicles.v_name FROM bookings, clients, vehicles WHERE bookings.c_id = clients.c_id AND bookings.v_id = vehicles.v_id AND bookings.book_id = '$bookId'";
    $result = mysqli_query($connect, $query);

    if ($result) {
         $bookingDetails = mysqli_fetch_assoc($result);
    echo json_encode($bookingDetails);

        // Construct the HTML content to display in the modal
        $htmlContent = '<p><strong>Booking ID:</strong> ' . $bookingDetails['book_id'] . '</p>';
        $htmlContent .= '<p><strong>Pickup Location:</strong> ' . $bookingDetails['pickup'] . '</p>';
        $htmlContent .= '<p><strong>Destination:</strong> ' . $bookingDetails['destination'] . '</p>';
        // Add more details as needed

        echo $htmlContent;
    } else {
        echo 'Error: Unable to fetch booking details.';
    }
} else {
    echo 'Error: No booking ID provided.';
}

mysqli_close($connect);
?>
