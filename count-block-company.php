<?php
include('config.php');
$sql = "SELECT COUNT(*) AS block_company_count FROM companies WHERE companies.acount_status = 0";
$result = $connect->query($sql);
$block_company_count = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $block_company_count  = $row['block_company_count'];
}
?>