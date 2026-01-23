<?php
include('../../configuration.php');
include('../../session.php');

$book_id = $_POST['book_id'];
$b_type_id = $_POST['b_type_id'];
$c_id  = $_POST['c_id'];
$pickup = $_POST['pickup'];
$dropoff = $_POST['dropoff']; 
$stops = array();        
foreach ($_POST as $key => $value) {
	if (substr($key, 0, 5) === 'stop_') {
		$stops[] = $value;
	}                
}
$address = $_POST['address'];
$postal_code = $_POST['postal_code'];
$passenger = $_POST['passenger'];
$pick_date  = $_POST['pick_date'];
$pick_time  = $_POST['pick_time'];
$journey_type  = $_POST['journey_type'];
$v_id = $_POST['v_id'];
$luggage  = $_POST['luggage'];
$child_seat = $_POST['child_seat'];
$flight_number = $_POST['flight_number'];
$delay_time = $_POST['delay_time'];
$note = $_POST['note'];
$journey_fare = $_POST['journey_fare'];
$journey_distance = $_POST['journey_distance'];
$booking_fee = $_POST['booking_fee'];
$car_parking  = $_POST['car_parking'];
$waiting = $_POST['waiting'];
$tolls  = $_POST['tolls'];
$extra  = $_POST['extra'];
$booker_commission = $_POST['booker_com'];
$customer_name = $_POST['c_name'];
$customer_email = $_POST['cemail'];
$customer_phone = $_POST['cphone'];
$booking_status  = 'Pending';
$sql = "UPDATE `bookings` SET 
			`b_type_id`='$b_type_id',
			`c_id`='$c_id',
			`pickup`='$pickup',
			`stops`='" . implode(' | ', $stops) . "',
			`destination`='$dropoff',
			`address`='$address',
			`postal_code`='$postal_code',
			`passenger`='$passenger',
			`pick_date`='$pick_date',
			`pick_time`='$pick_time',
			`journey_type`='$journey_type',
			`v_id`='$v_id',
			`luggage`='$luggage',
			`child_seat`='$child_seat',
			`flight_number`='$flight_number',
			`delay_time`='$delay_time',
			`note`='$note',
			`journey_fare`='$journey_fare',
			`journey_distance`='$journey_distance',
			`booking_fee`='$booking_fee',
			`car_parking`='$car_parking',
			`waiting`='$waiting',
			`tolls`='$tolls',
			`extra`='$extra',
			`booker_commission`='$booker_commission' WHERE `book_id`='$book_id'";
$result = mysqli_query($connect, $sql);
if ($result) {
    $insert = "INSERT INTO `bookings_history`(
					`book_id`, 
					`b_type_id`, 
					`c_id`, 
					`pickup`, 
					`stops`, 
					`destination`, 
					`address`, 
					`postal_code`, 
					`passenger`, 
					`pick_date`, 
					`pick_time`, 
					`journey_type`, 
					`v_id`, 
					`luggage`, 
					`child_seat`, 
					`flight_number`, 
					`delay_time`, 
					`note`, 
					`journey_fare`, 
					`journey_distance`, 
					`booking_fee`, 
					`car_parking`, 
					`waiting`, 
					`tolls`, 
					`extra`, 
					`booker_commission`,									
					`customer_name`, 
					`customer_email`, 
					`customer_phone`
					) VALUES (
					'$book_id',
					'$b_type_id',
					'$c_id',
					'$pickup',
					'" . implode(' | ', $stops) . "',
					'$dropoff',
					'$address',
					'$postal_code',
					'$passenger',
					'$pick_date',
					'$pick_time',
					'$journey_type',
					'$v_id',
					'$luggage',
					'$child_seat',
					'$flight_number',
					'$delay_time',
					'$note',
					'$journey_fare',
					'$journey_distance',
					'$booking_fee',
					'$car_parking',
					'$waiting',
					'$tolls',
					'$extra',
					'$booker_commission',
					'$customer_name',
					'$customer_email',									
					'$customer_phone')";
    $insertresult = mysqli_query($connect, $insert); 
    $activity_type = 'Booking Updated';
    $user_type = 'user';
    $details = "Booking " . $book_id . " Has Been Updated by Controller.";
    $actsql = "INSERT INTO `activity_log`(
					`activity_type`, 
					`user_type`, 
					`user_id`, 
					`details`
					) VALUES (
					'$activity_type',
					'$user_type',
					'$myId',
					'$details')";
    $actr = mysqli_query($connect, $actsql);	
    header('Location: view-booking.php?book_id='.$book_id);    
    exit();    
} else {		
    header('Location: view-booking.php?book_id='.$book_id);    
}
$connect->close();
?>