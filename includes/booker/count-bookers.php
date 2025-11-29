<?php
include('../../configuration.php');
$sql = "SELECT COUNT(*) AS count_customers FROM clients WHERE clients.account_type = 2";
$result = $connect->query($sql);
$booker_count = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $booker_count  = $row['count_customers'];
}
?>