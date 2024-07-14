<?php
// Include configuration and session management files
require_once('config.php');
require_once('session.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $mg_id = $_POST['mg_id'];
    $pickup_location = $_POST['pickup_location'];
    $pickup_charges = $_POST['pickup_charges'];

    // Update query
    $sql = "UPDATE `mg_charges` SET `pickup_location` = ?, `pickup_charges` = ? WHERE `mg_id` = ?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("ssi", $pickup_location, $pickup_charges, $mg_id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        // Redirect to the list page after successful update
        header("Location: pricing.php"); // Replace with appropriate redirect URL
        exit();
    } else {
       header("Location: pricing.php"); // Replace with appropriate redirect URL
        exit();
    }
} else {
    echo "Invalid request.";
}
?>
