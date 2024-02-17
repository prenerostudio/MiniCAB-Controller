<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Validate and sanitize input data
$c_id = isset($_POST['c_id']) ? $_POST['c_id'] : null;
$c_name = isset($_POST['c_name']) ? $_POST['c_name'] : null;
$c_phone = isset($_POST['c_phone']) ? $_POST['c_phone'] : null;
$pickup = isset($_POST['pickup']) ? $_POST['pickup'] : null;
$dropoff = isset($_POST['dropoff']) ? $_POST['dropoff'] : null;
$stops = isset($_POST['stops']) ? $_POST['stops'] : null;
$passenger = isset($_POST['passenger']) ? $_POST['passenger'] : null;
$pick_date = isset($_POST['pick_date']) ? $_POST['pick_date'] : null;
$pick_time = isset($_POST['pick_time']) ? $_POST['pick_time'] : null;
$journey_type = isset($_POST['journey_type']) ? $_POST['journey_type'] : null;
$v_id = isset($_POST['v_id']) ? $_POST['v_id'] : null;
$luggage = isset($_POST['luggage']) ? $_POST['luggage'] : null;
$journey_fare = isset($_POST['journey_fare']) ? $_POST['journey_fare'] : null;
$journey_distance = isset($_POST['journey_distance']) ? $_POST['journey_distance'] : null;
$note = isset($_POST['note']) ? $_POST['note'] : null;
$booking_status = 'Pending';
$commission = $_POST['commission'];
$date = date("Y-m-d H:i:s");

if ($c_id) {
    
	// Sanitize data before using in SQL query
    $pickup = mysqli_real_escape_string($connect, $pickup);
    $dropoff = mysqli_real_escape_string($connect, $dropoff);

    $sql = "INSERT INTO `bookings`(
									`b_type_id`, 
									`c_id`, 
									`c_name`, 
									`c_phone`, 
									`pickup`, 
									`stops`,
									`destination`,
									`passenger`, 
									`pick_date`, 
									`pick_time`, 
									`journey_type`, 
									`v_id`, 
									`luggage`, 
									`note`, 
									`journey_fare`,
									`journey_distance`,
									`booking_status`,
									`book_add_date`
									) VALUES (
									'3',
									'$c_id',
									'$c_name',
									'$c_phone',
									'$pickup',
									'$stops',
									'$dropoff',
									'$passenger',
									'$pick_date',
									'$pick_time',
									'$journey_type',
									'$v_id',
									'$luggage',
									'$note',
									'$journey_fare',
									'$journey_distance',
									'$booking_status',
									'$date')";

    
	$r = mysqli_query($connect, $sql);

    if ($r) {
        // Fetch the last inserted ID (book_id)
       
		$book_id = mysqli_insert_id($connect);      

       
       
           
		$bsql = "INSERT INTO `booker_account`(`c_id`, `book_id`, `comission_amount`, `commission_date`) VALUES ('$c_id','$book_id','$commission','$date')";
          
		$br = mysqli_query($connect, $bsql);
       

        
		echo json_encode(array('message' => "Booking Posted Successfully", 'status' => true));
    } else {
        echo json_encode(array('message' => "Error In Posting Booking", 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
