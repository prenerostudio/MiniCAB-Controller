<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

if (isset($_POST['d_id'])) {   
    $currentDate = date('Y-m-d');
$start = $currentDate . ' 00:00:00';
$end = date('Y-m-d 23:59:59', strtotime('+7 days'));
	// Prevent SQL injection by using proper variable escaping if mysqli or prepared statements later
	$d_id = mysqli_real_escape_string($connect, $_POST['d_id']);

	$sql = "SELECT j.*, c.*, d.*, b.*, bt.* FROM jobs AS j JOIN drivers AS d ON j.d_id = d.d_id JOIN clients AS c ON j.c_id = c.c_id JOIN bookings AS b ON j.book_id = b.book_id JOIN booking_type AS bt ON b.b_type_id = bt.b_type_id WHERE j.d_id = '$d_id' AND j.job_status <> 'Completed' AND b.pick_date BETWEEN '$start' AND '$end' ORDER BY j.job_id DESC";
    $r = mysqli_query($connect, $sql);
    $output = mysqli_fetch_all($r, MYSQLI_ASSOC);
    if (count($output) > 0) {
        echo json_encode(array('data' => $output, 'status' => true, 'message' => "Job List Fetch Successfully"));
    } else {
        echo json_encode(array('message' => 'No Job is Available', 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>