<?php
include('config.php');
include('session.php');	

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
$booker_com = $_POST['booker_com'];
$booking_status  = 'Pending';
$cname = $_POST['c_name'];
$cemail = $_POST['cemail'];
$cphone = $_POST['cphone'];


$sql = "INSERT INTO `bookings`(
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
								`booking_status`, 
								`customer_name`, 
								`customer_email`, 
								`customer_phone`
								) VALUES (
								'$b_type_id',
								'$c_id',
								'$pickup',
								'" . implode(',', $stops) . "',
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
								'$booker_com',
								'$booking_status',
								'$cname',
								'$cemail',
								'$cphone')";

$result = mysqli_query($connect, $sql);       
if ($result) {
	$book_id = mysqli_insert_id($connect);	
	$activity_type = 'New Booking';		
	$user_type = 'user';        	
	$details = "Controller Has added a new booking $book_id";

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
	header('Location: all-bookings.php');    
} else {		
	header('Location: all-bookings.php');    
}
$connect->close();
?>