<?php
include('config.php');
$sql = "SELECT COUNT(*) AS count_ap FROM airports";
$result = $connect->query($sql);
$ap_count = 0;
if ($result->num_rows > 0) {  
    $row = $result->fetch_assoc();
    $ap_count  = $row['count_ap'];
}
?>