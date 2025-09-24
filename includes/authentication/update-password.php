<?php
// update-password.php
session_start();
require_once '../../config.php'; // DB connection

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user_id = (int) $_POST['user_id'];
    $password = $_POST['password'] ?? '';
    $confirmPassword = $_POST['confirm_password'] ?? '';

    // Validation
    if (empty($password) || empty($confirmPassword)) {
        echo json_encode(['status' => 'error', 'title' => 'Missing Fields', 'message' => 'Please fill all fields.']);
        exit;
    }

    if ($password !== $confirmPassword) {
        echo json_encode(['status' => 'error', 'title' => 'Password Mismatch', 'message' => 'Passwords do not match.']);
        exit;
    }

    // Hash the password
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    $stmt = $connect->prepare("UPDATE users SET user_password = ? WHERE user_id = ?");
    $stmt->bind_param("si", $hashedPassword, $user_id);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'title' => 'Updated!', 'message' => 'Password updated successfully.']);
    } else {
        echo json_encode(['status' => 'error', 'title' => 'Database Error', 'message' => $stmt->error]);
    }

    $stmt->close();
    $connect->close();
} else {
    echo json_encode(['status' => 'error', 'title' => 'Invalid Request', 'message' => 'Only POST method allowed.']);
}
