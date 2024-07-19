<?php
include('config.php');

// SQL query to get the number of bookings
$sql = "SELECT COUNT(*) AS active_company_count FROM companies WHERE companies.acount_status = 1";
$result = $connect->query($sql);

$active_company_count = 0;

if ($result->num_rows > 0) {
    // Fetch the result
    $row = $result->fetch_assoc();
    $active_company_count  = $row['active_company_count'];
}

?>
