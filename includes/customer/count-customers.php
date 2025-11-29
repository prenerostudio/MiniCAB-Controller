<?php
include('../../configuration.php');
$sql = "SELECT COUNT(*) AS count_customers FROM clients WHERE clients.account_type = 1";
$result = $connect->query($sql);
$customer_count = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $customer_count  = $row['count_customers'];
}
?>