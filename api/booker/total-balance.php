<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

if(isset($_POST['c_id'])){
	$c_id = mysqli_real_escape_string($connect, $_POST['c_id']);        
	$sql = "SELECT c_id, SUM(comission_amount) AS total_commission FROM booker_account WHERE c_id = '$c_id' GROUP BY c_id";    
	$result = mysqli_query($connect, $sql);    
	if(mysqli_num_rows($result) > 0){    
		$output = mysqli_fetch_assoc($result);        
		echo json_encode(array('data' => $output, 'status' => true, 'message' => "Total commission fetched successfully"));    
	} else {            
		echo json_encode(array('message' => 'No commission found for the given c_id', 'status' => false));
	}
} else {    
	echo json_encode(array('message' => "c_id is missing in the request", 'status' => false));
}
?>