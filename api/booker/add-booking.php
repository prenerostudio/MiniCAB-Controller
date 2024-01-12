<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$b_type_id = 1;
$c_id  = $_POST['c_id'];
$pickup = $_POST['pickup'];
$dropoff = $_POST['dropoff'];
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
$booking_status  = 'Pending';
$date = date("Y-m-d H:i:s");

if(isset($_POST['c_id'])){ 	 	
	        		
		$sql = "INSERT INTO `bookings`(
								`b_type_id`,
								`c_id`, 
								`pickup`, 
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
								`booking_status`, 
								`book_add_date`
								) VALUES (
								'$b_type_id',
								'$c_id',
								'$pickup',
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
								'$booking_status',
								'$date')";
		$r=mysqli_query($connect,$sql);
		if($r){    
			echo json_encode(array('message'=>"Booking Posted Successfully",'status'=>true));
		}else{    
			echo json_encode(array('message'=>"Error In Posting Booking",'status'=>false));
		}
	       
}else{
   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>