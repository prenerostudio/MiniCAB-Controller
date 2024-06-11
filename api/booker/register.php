<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_name = $_POST['c_name'];
$c_email = $_POST['c_email'];
$c_phone = $_POST['c_phone'];
$c_password = $_POST['c_password'];
$account_type = 2;
$acount_status = 0;

if (isset($_POST['c_phone'])) {	   
	$checksql = "SELECT * FROM `clients` WHERE `c_phone`='$c_phone'";    		
	$checkr = mysqli_query($connect, $checksql);    	
	$datacheck = mysqli_fetch_all($checkr, MYSQLI_ASSOC);        	
	if (count($datacheck) > 0) {    		
		echo json_encode(array('message' => "This User Already Exists! Try to Sign in", 'status' => false));        	
	} else {    
		$sql = "INSERT INTO `clients`( 
									`c_name`, 
									`c_email`, 
									`c_phone`, 
									`c_password`,
									`acount_status`,
									`account_type`
									) VALUES (
									'$c_name',
									'$c_email',
									'$c_phone',
									'$c_password',
									'$acount_status',
									'$account_type')";                    		
		$r = mysqli_query($connect, $sql);        		
		if ($r) {     		
			$c_id = mysqli_insert_id($connect); 					
			$activity_type = 'New Account Created';		
			$user_type = 'client';		
			$details = "New Booker Account registered.";		
			$actsql = "INSERT INTO `activity_log`(
										`activity_type`, 
										`user_type`, 
										`user_id`, 
										`details`
										) VALUES (
										'$activity_type',
										'$user_type',
										'$c_id',
										'$details')";
			$actr = mysqli_query($connect, $actsql);			
			echo json_encode(array('message' => "Booker Registered Successfully", 'status' => true));            
		} else {        
			echo json_encode(array('message' => "Error In Registering Driver", 'status' => false));            
		}        
	}    
} else {
	echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>