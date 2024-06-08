<?php
include('config.php'); 

$driver_list_html = '<table class="table table-responsive">'; 
$driver_list_html .= '<thead>'; 
$driver_list_html .= '<tr>'; 
$driver_list_html .= '<th class="w-1">ID</th>'; 
$driver_list_html .= '<th>Driver</th>'; 
$driver_list_html .= '<th>Status</th>'; 
$driver_list_html .= '</tr>'; 
$driver_list_html .= '</thead>'; 
$driver_list_html .= '<tbody>'; 

$x = 0;
$drvsql = mysqli_query($connect, "SELECT * FROM `drivers` WHERE `status`='online'");
while ($drvrow = mysqli_fetch_array($drvsql)) {
    $x++;
    $driver_list_html .= '<tr>'; 
    $driver_list_html .= '<td>' . $x . '</td>'; 
    $driver_list_html .= '<td><span class="text-secondary">' . $drvrow['d_name'] . '</span></td>'; 
    $driver_list_html .= '<td><span class="badge bg-success me-1"></span> ' . $drvrow['status'] . '</td>'; 
    $driver_list_html .= '</tr>'; 
}

$driver_list_html .= '</tbody>'; 
$driver_list_html .= '</table>'; 
echo $driver_list_html;
?>