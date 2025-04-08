<?php
// Include your database connection script
include('config.php');

function getMessages($connect, $user_id, $receiver_id) {
    $query = "SELECT m.*, d.d_name AS sender_name FROM messages m
              JOIN drivers d ON m.sender_id = d.d_id
              WHERE (m.sender_id = ? AND m.receiver_id = ?) OR (m.sender_id = ? AND m.receiver_id = ?)
              ORDER BY m.sent_at ASC";
    $stmt = $connect->prepare($query);
    $stmt->bind_param("iiii", $user_id, $receiver_id, $receiver_id, $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $messages = $result->fetch_all(MYSQLI_ASSOC);
    return $messages;
}
// Example usage:
if (isset($_GET['receiver_id'])) {
    $receiver_id = $_GET['receiver_id'];
    // Assuming current user's ID is stored in session or passed through some means
    $user_id = 1; // Replace with actual user ID
    $messages = getMessages($connect, $user_id, $receiver_id);

// Assuming $messages is the array of messages retrieved from the database
foreach ($messages as $message) {
    // Check if the message sender is the current user or the receiver
    $isSender = $message['sender_id'] == $user_id;

    // Set CSS class based on whether the message is from the sender or receiver
    $messageClass = $isSender ? 'chat-bubble-me' : 'chat-bubble';

    // Set alignment based on whether the message is from the sender or receiver
    $alignmentClass = $isSender ? 'justify-content-end' : 'justify-content-start';

    // Output HTML for the message
    echo '<div class="chat-item">';
    echo '<div class="row align-items-end ' . $alignmentClass . '">'; // Apply alignment class
    echo '<div class="col col-lg-6">';
    echo '<div class="chat-bubble ' . $messageClass . '">'; // Apply message class
    echo '<div class="chat-bubble-title">';
    echo '<div class="row">';
    echo '<div class="col chat-bubble-author">' . $message['sender_name'] . '</div>'; // Display sender name
    echo '<div class="col-auto chat-bubble-date">' . $message['sent_at'] . '</div>'; // Display sent time
    echo '</div>';
    echo '</div>';
    echo '<div class="chat-bubble-body">';
    echo '<p>' . $message['message'] . '</p>'; // Display message
    echo '</div>';
    echo '</div>';
    echo '</div>';
    echo '</div>';
    echo '</div>';
}


} else {
    echo 'Please select a user to start chatting';
}

// Close database connection
$connect->close();
?>
