<?php
// Include your database connection script
include('config.php');

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Assuming you have user authentication and receiver ID is received from the form
    $sender_id = 1; // Replace with actual sender's user ID
    $receiver_id = $_POST['receiver_id'];
    $message = $_POST['message'];

    // Insert message into the database
    $query = "INSERT INTO messages (sender_id, receiver_id, message) VALUES (?, ?, ?)";
    $stmt = $connect->prepare($query);
    $stmt->bind_param("iis", $sender_id, $receiver_id, $message);
    $stmt->execute();
    $stmt->close();

    // Redirect back to chat interface
    header("Location: inbox.php");
    exit();
} else {
    // If accessed directly, redirect to chat interface
    header("Location: inbox.php");
    exit();
}
?>
