<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (isset($_POST['d_phone'])) {
	$d_email = $_POST['d_email'];    
	$d_phone = $_POST['d_phone'];	
	$d_password = $_POST['d_password'];    
	$licence_authority = $_POST['licence_authority'];    
	$acount_status = 0;    
	$date = date("Y-m-d h:i:s");
	         			
	$checksql = "SELECT * FROM `drivers` WHERE `d_phone`='$d_phone'";		
	$checkr = mysqli_query($connect, $checksql);        		
	$datacheck = mysqli_fetch_all($checkr, MYSQLI_ASSOC);
        		
	if (count($datacheck) > 0) {            		
		echo json_encode(array('message' => "This User Already Exists! Try to Sign in", 'status' => false));        	
	} else {		
		$sql = "INSERT INTO `drivers`( 
									`d_email`, 
									`d_phone`, 
									`d_password`, 
									`licence_authority`, 
									`acount_status`, 
									`driver_reg_date`
									) VALUES ( 
									'$d_email', 
									'$d_phone', 
									'$d_password', 
									'$licence_authority', 
									'$acount_status', 
									'$date')";
                    
		$r = mysqli_query($connect, $sql);        		
		if ($r) {								
			$d_id = mysqli_insert_id($connect);   						
			$dsql = "INSERT INTO `driver_documents`(`d_id`, `date_upload_document`) VALUES ('$d_id', '$date')";            
            $dr = mysqli_query($connect, $dsql);
												             
			echo json_encode(array('message' => "Driver Registered Successfully", 'status' => true));            
		} else {        
			echo json_encode(array('message' => "Error In Registering Driver", 'status' => false));            
		}        
	}    
} else {
	echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>