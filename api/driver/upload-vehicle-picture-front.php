<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if (isset($_POST['d_id'])) {
	
	$d_id = $_POST['d_id'];        
	$targetDir = "../../img/drivers/vehicle/picture/";    
	$fileExtension = strtolower(pathinfo($_FILES["pic1"]["name"], PATHINFO_EXTENSION));    
	$allowTypes = array('jpg', 'png', 'jpeg', 'gif');    
	$uniqueId = uniqid();    
	$pic1 = $uniqueId . "." . $fileExtension;    
	$targetFilePath = $targetDir . $pic1;
    
	if (in_array($fileExtension, $allowTypes)) {    
		if (move_uploaded_file($_FILES["pic1"]["tmp_name"], $targetFilePath)) {                   
			$r = $connect->query("UPDATE `vehicle_documents` SET `vehicle_picture_front`='$pic1' WHERE `d_id`='$d_id'");
			if($r){															             			
				echo json_encode(array('message' => "Vehicle Front Picture Upload Successfully", 'status' => true));            		
			} else {        
				echo json_encode(array('message' => "Error In Uploading Picture", 'status' => false));	
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