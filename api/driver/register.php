<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (isset($_POST['d_phone'])) {
	
	$d_name = $_POST['d_name'];								  
	$d_email = $_POST['d_email'];    
	$d_phone = $_POST['d_phone'];	
	$d_password = $_POST['d_password'];    
	$licence_authority = $_POST['licence_authority'];    
	$acount_status = 0;	

	// Hash the password before storing it
	$hashed_password = password_hash($d_password, PASSWORD_DEFAULT);
	         			
	$checksql = "SELECT * FROM `drivers` WHERE `d_phone`='$d_phone'";		
	$checkr = mysqli_query($connect, $checksql);        		
	$datacheck = mysqli_fetch_all($checkr, MYSQLI_ASSOC);
        		
	if (count($datacheck) > 0) {            		
		echo json_encode(array('message' => "This User Already Exists! Try to Sign in", 'status' => false));        	
	} else {		
		$sql = "INSERT INTO `drivers`(
									`d_name`, 
									`d_email`, 
									`d_phone`, 
									`d_password`, 
									`licence_authority`, 
									`acount_status`
									) VALUES (
									'$d_name',
									'$d_email',
									'$d_phone',
									'$hashed_password',
									'$licence_authority',
									'$acount_status')";
                    
		$r = mysqli_query($connect, $sql);        		
		if ($r) {
			$d_id = mysqli_insert_id($connect);   						
			$dsql = "INSERT INTO `driver_documents`(`d_id`) VALUES ('$d_id')";            
            $dr = mysqli_query($connect, $dsql);	
			
			$vsql = "INSERT INTO `vehicle_documents`(`d_id`) VALUES ('$d_id')";
			$vr = mysqli_query($connect, $vsql);
			
			$activity_type = 'New Driver Profile Registered';		
			$user_type = 'driver';		
			$details = "New Driver Acount Created by $d_name";
				
			$actsql = "INSERT INTO `activity_log`(
												`activity_type`, 
												`user_type`, 
												`user_id`, 
												`details`
												) VALUES (
												'$activity_type',
												'$user_type',
												'$d_id',
												'$details')";		
							
			$actr = mysqli_query($connect, $actsql);
									
			echo json_encode(array('data'=>$d_id,'message' => "Driver Registered Successfully", 'status' => true));            
		} else {        
			echo json_encode(array('message' => "Error In Registering Driver", 'status' => false));
		}        
	}    
} else {
	echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
