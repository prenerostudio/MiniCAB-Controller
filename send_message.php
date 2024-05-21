<?php
include('config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {    
	$sender_id = 1; 
    $receiver_id = $_POST['receiver_id'];
    $message = $_POST['message'];
    $query = "INSERT INTO messages (sender_id, receiver_id, message) VALUES (?, ?, ?)";
    $stmt = $connect->prepare($query);
    $stmt->bind_param("iis", $sender_id, $receiver_id, $message);
    $stmt->execute();
    $stmt->close();
    header("Location: inbox.php");
    exit();
} else {
    header("Location: inbox.php");
    exit();
}
?>