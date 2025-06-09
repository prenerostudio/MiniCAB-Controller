<?php
// update-password.php

session_start();
require_once 'config.php'; // Your DB connection file

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user_id = $_POST['user_id'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirm-password'];

    // Extra validation (in case JS is bypassed)
    if ($password !== $confirmPassword) {
        die("Passwords do not match.");
    }

    // Hash the password
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Update in database
    $stmt = $connect->prepare("UPDATE users SET user_password = ? WHERE user_id = ?");
    $stmt->bind_param("ss", $hashedPassword, $user_id);

    if ($stmt->execute()) {
        echo "Password updated successfully. <a href='profile-setting.php'>Go back</a>";
    } else {
        echo "Error updating password: " . $stmt->error;
    }

    $stmt->close();
    $connect->close();
} else {
    echo "Invalid request.";
}
?>
