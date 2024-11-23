<?php
include('config.php');


$sql = "SELECT COUNT(*) AS count_des FROM destinations";
$result = $connect->query($sql);

$des_count = 0;

if ($result->num_rows > 0) {
    
    $row = $result->fetch_assoc();
    $des_count  = $row['count_des'];
}

?>
