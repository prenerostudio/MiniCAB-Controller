<?php
include('config.php');
// Function to fetch vehicle pricing from the database
function fetchVehiclePricingFromDatabase($vehicleId) {
    global $connect;

    // Sanitize input to prevent SQL injection
    $vehicleId = mysqli_real_escape_string($connect, $vehicleId);

    // Your SQL query to fetch vehicle pricing based on the provided vehicle ID
    $query = "SELECT v_pricing FROM vehicles WHERE v_id = '$vehicleId'";

    // Execute the query
    $result = mysqli_query($connect, $query);

    // Check if the query was successful
    if ($result) {
        // Fetch the result row
        $row = mysqli_fetch_assoc($result);

        // Check if a valid row was fetched
        if ($row) {
            // Return the fetched vehicle pricing
            return $row['v_pricing'];
        } else {
            // Handle the case where no row was fetched
            return 0; // Return a default value or handle it based on your requirements
        }
    } else {
        // Handle the case where the query was not successful
        return 0; // Return a default value or handle it based on your requirements
    }
}




$b_type_id = $_POST['b_type_id'];
$c_id  = $_POST['c_id'];
$pickup = $_POST['pickup'];
$dropoff = $_POST['dropoff'];

// Array to hold stop locations
    $stops = array();

    // Loop through all stop fields
    foreach ($_POST as $key => $value) {
        // Check if the field starts with 'stop_'
        if (substr($key, 0, 5) === 'stop_') {
            // Add stop location to the stops array
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
$booking_status  = 'Pending';
$date = date("Y-m-d H:i:s");



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
								`booking_status`, 
								`book_add_date`
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
								'$booking_status',
								'$date')";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: all-bookings.php');    
	exit();    
} else {		
	header('Location: all-bookings.php');    
}
$connect->close();
?>
