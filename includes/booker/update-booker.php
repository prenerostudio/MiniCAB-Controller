<?php
require '../../configuration.php';
include('../../session.php');

// 🔹 Ensure no stray output
ob_clean();
header('Content-Type: application/json');
error_reporting(0); // Hide PHP warnings in JSON

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $c_id = $_POST['c_id'];
    $cname = $_POST['cname'];
    $cemail = $_POST['cemail'];
    $cgender = $_POST['cgender'];
    $caddress = $_POST['caddress'];
    $clang = $_POST['clang'];
    $pc = $_POST['pc'];
    $cni = $_POST['cni'];
    $com_name = $_POST['com_name'];
    $com_type = $_POST['com_type'];
    $percent = $_POST['percent'];
    $fixed = $_POST['fixed'];

    $sql = "UPDATE clients SET 
                c_name = ?,
                c_email = ?,
                c_address = ?,
                c_gender = ?,
                c_language = ?,
                postal_code = ?,
                c_ni = ?,
                company_name = ?,
                commission_type = ?";

    if ($com_type == 1) {
        $sql .= ", percentage = ?, fixed = NULL";
    } else {
        $sql .= ", fixed = ?, percentage = NULL";
    }

    $sql .= " WHERE c_id = ?";

    $stmt = mysqli_prepare($connect, $sql);
    if (!$stmt) {
        echo json_encode(["status" => "error", "message" => "Database prepare failed."]);
        exit;
    }

    if ($com_type == 1) {
        mysqli_stmt_bind_param($stmt, "ssssssssiss", $cname, $cemail, $caddress, $cgender, $clang, $pc, $cni, $com_name, $com_type, $percent, $c_id);
    } else {
        mysqli_stmt_bind_param($stmt, "ssssssssiss", $cname, $cemail, $caddress, $cgender, $clang, $pc, $cni, $com_name, $com_type, $fixed, $c_id);
    }

    if (mysqli_stmt_execute($stmt)) {
        // Log activity
        $activity_type = 'Booker Profile Updated';
        $user_type = 'user';
        $details = "Booker Profile $c_id has been updated by Controller.";
        $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details)
                   VALUES ('$activity_type', '$user_type', '$myId', '$details')";
        mysqli_query($connect, $actsql);

        echo json_encode(["status" => "success", "message" => "Booker profile updated successfully!"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to execute update query."]);
    }

    mysqli_stmt_close($stmt);
    mysqli_close($connect);
    exit;
}
?>
