<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$distance = $_POST['distance'];
$per_mile_price = 5;
$journey_type = $_POST['journey_type'];

if($journey_type=='One Way'){
	
$jouney_fare = $distance * $per_mile_price;
	
}elseif($journey_type=='Return'){
	
	$jouney_fare = ($distance * $per_mile_price) * 2;
}else{
	$jouney_fare = 0;
	'Error in Counting Fare';
}



	
	if($jouney_fare){    				    				
	echo json_encode(array('data'=>$jouney_fare, 'status'=>true,));	
}else{    		
	echo json_encode(array('message'=>'No Fare Found','status'=>false));	
}
?>
