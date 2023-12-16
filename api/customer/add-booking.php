<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id = $_POST['c_id'];
$pickup = $_POST['pickup'];
$dropoff = $_POST['dropoff'];
$distance = $_POST['distance'];
$fare = $_POST['fare'];
$passenger = $_POST['passenger'];
$luggage = $_POST['luggage'];
$journey_type = $_POST['journey_type'];
$note = $_POST['note'];
$pdate = $_POST['pdate'];
$ptime = $_POST['ptime'];
$status = 'Pending';
$date = date("Y-m-d h:i:s");

if(isset($_POST['c_id'])){ 	 	
	        		
		$sql="INSERT INTO `bookings`(
									`c_id`, 
									`pickup`, 
									`destination`, 
									`passenger`,
									`luggage`, 
									`note`, 
									`book_date`, 
									`book_time`, 
									`journey_type`, 
									`journey_fare`, 
									`journey_distance`, 
									`booking_status`,
									`book_add_date`
									) VALUES (
									'$c_id',
									'$pickup',
									'$dropoff',
									'$passenger',
									'$luggage',
									'$note',
									'$pdate',
									'$ptime',
									'$journey_type',
									'$fare',
									'$distance',
									'$status',
									'$date'
									)";				
		
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