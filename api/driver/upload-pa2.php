<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (isset($_POST['d_id'])) {
	
	$d_id = $_POST['d_id'];        
	$targetDir = "../../img/drivers/address-proof/";    
	$fileExtension = strtolower(pathinfo($_FILES["pa2"]["name"], PATHINFO_EXTENSION));    
	$allowTypes = array('jpg', 'png', 'jpeg', 'gif');    
	$uniqueId = uniqid();    
	$pa2 = $uniqueId . "." . $fileExtension;    
	$targetFilePath = $targetDir . $pa2;
    
	if (in_array($fileExtension, $allowTypes)) {    
		if (move_uploaded_file($_FILES["pa2"]["tmp_name"], $targetFilePath)) {                   
			$r = $connect->query("UPDATE `driver_documents` SET `address_proof_2`='$pa2' WHERE `d_id`='$d_id'");
			if($r){	
				$activity_type = "Driver Document updated";		
				$user_type = 'driver';		
				$details = "You have updated Address Proof Document.";
		
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
				echo json_encode(array('message' => "Address Proof Upload Successfully", 'status' => true));            		
			} else {        
				echo json_encode(array('message' => "Error In Uploading Address Proof", 'status' => false));	
			}        								
		} else {		
			echo json_encode(array('message' => "File upload failed, please try again.", 'status' => false));        
		}    
	} else {
		echo json_encode(array('message' => "Invalid file type.", 'status' => false));                 
	}					                    		     	   
} else {
	echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>