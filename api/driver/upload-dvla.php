<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (isset($_POST['d_id'])) {
	
	$d_id = $_POST['d_id'];        
	$targetDir = "../../img/drivers/dvla/";    
	$fileExtension = strtolower(pathinfo($_FILES["dvla"]["name"], PATHINFO_EXTENSION));    
	$allowTypes = array('jpg', 'png', 'jpeg', 'gif');    
	$uniqueId = uniqid();    
	$dvla = $uniqueId . "." . $fileExtension;    
	$targetFilePath = $targetDir . $dvla;
    
	if (in_array($fileExtension, $allowTypes)) {    
		if (move_uploaded_file($_FILES["dvla"]["tmp_name"], $targetFilePath)) {                   
			$r = $connect->query("UPDATE `driver_documents` SET `dvla_check_code`='$dvla' WHERE `d_id`='$d_id'");
			if($r){															             			
				echo json_encode(array('message' => "DVLA  Upload Successfully", 'status' => true));            		
			} else {        
				echo json_encode(array('message' => "Error In Uploading DVLA", 'status' => false));	
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