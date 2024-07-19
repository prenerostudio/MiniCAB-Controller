<?php
include('config.php');
// Calculate the date 10 days from today
$ten_days_from_today = date('Y-m-d', strtotime('+10 days'));

// SQL query to update account_status
$sql = "
    UPDATE drivers d
    JOIN driver_vehicle dv ON d.d_id = dv.d_id
    SET d.account_status = 2
    WHERE
        d.account_status <> 2 AND
        (
            DATE(dv.v_phv_expiry) BETWEEN CURDATE() AND '$ten_days_from_today'
            OR
            DATE(dv.v_ti_expiry) BETWEEN CURDATE() AND '$ten_days_from_today'
            OR
            DATE(dv.v_mot_expiry) BETWEEN CURDATE() AND '$ten_days_from_today'
        )
";

if ($conn->query($sql) === TRUE) {
    echo "Account statuses updated successfully.";
} else {
    echo "Error updating account statuses: " . $conn->error;
}

$conn->close();
?>
