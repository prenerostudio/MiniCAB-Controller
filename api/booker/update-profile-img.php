<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

function uploadImage() {
	$targetDir = "../../img/customers/";   
	$fileExtension = strtolower(pathinfo($_FILES["c_img"]["name"], PATHINFO_EXTENSION));
	$targetFilePath = $targetDir . basename($_FILES["c_img"]["name"]);    
	$fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));    
	$allowTypes = array('jpg', 'png', 'jpeg', 'gif');  
	 $uniqueId = uniqid();  // Generate a unique identifier
    $c_img = $uniqueId . "." . $fileExtension;  // Append the unique identifier to the file name
    $targetFilePath = $targetDir . $c_img;
	
	
	
	if (in_array($fileExtension, $allowTypes)) {    
		if (move_uploaded_file($_FILES["c_img"]["tmp_name"], $targetFilePath)) {        
			return $c_img;        
		} else {
			return false;        
		}    
	}
	return false;
}

$c_id = $_POST['c_id'];

// Handle image upload
$c_img = uploadImage();

if(isset($_POST['c_id'])){ 	 	        			
	$sql = "UPDATE `clients` SET `c_pic`='$c_img' WHERE `c_id`='$c_id'";
	$r = mysqli_query($connect, $sql);
	if($r){    
		$activity_type = 'Profile Image Updated';				
			$user_type = 'client';				
			$details = "Booker Updated Profile Image.";				
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
		echo json_encode(array('message'=>"Profile Img Update Successfully",'status'=>true));
	}else{    
		echo json_encode(array('message'=>"Error In Updating Profile Img",'status'=>false));
	}	 
}else{
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>