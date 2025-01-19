<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");




$sql = "SELECT `open-bookings`.*, bookings.*, booking_type.*, clients.*, vehicles.*,  drivers.* FROM `open-bookings` JOIN bookings ON `open-bookings`.book_id = bookings.book_id JOIN booking_type ON bookings.b_type_id = booking_type.b_type_id JOIN clients ON bookings.c_id = clients.c_id JOIN vehicles ON  bookings.v_id = vehicles.v_id LEFT JOIN drivers ON `open-bookings`.d_id = drivers.d_id ORDER BY `open-bookings`.ob_id DESC";

$r = mysqli_query($connect, $sql);

$output = mysqli_fetch_all($r, MYSQLI_ASSOC);

if (count($output) > 0) {

	
    echo json_encode(array('data' => $output, 'status' => true, 'message' => "Bookings List Fetch Successfully"));
    
} else {

	
    echo json_encode(array('message' => 'No Job is Available', 'status' => false));
    
}

?>