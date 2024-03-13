<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

function uploadImage() {
	$targetDir = "../../img/drivers/";    
	$targetFilePath = $targetDir . basename($_FILES["d_img"]["name"]);    
	$fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));    
	$allowTypes = array('jpg', 'png', 'jpeg', 'gif');    
	if (in_array($fileType, $allowTypes)) {    
		if (move_uploaded_file($_FILES["d_img"]["tmp_name"], $targetFilePath)) {        
			return $targetFilePath;        
		} else {
			return false;        
		}    
	}
	return false;
}

$d_id = $_POST['d_id'];
$dname = $_POST['dname'];
$demail = $_POST['demail'];
$d_address = $_POST['d_address'];
$dgender = $_POST['dgender'];
$pc = $_POST['post_code'];
$dlang = $_POST['dlang'];
$license_authority = $_POST['license_authority'];
$date = date("Y-m-d H:i:s");

// Handle image upload
$d_img = uploadImage();

if(isset($_POST['d_id'])){ 	 	        			
	$sql = "UPDATE `drivers` SET 
								`d_name`='$dname',
								`d_email`='$demail', 
								`d_address`='$d_address',
								`d_post_code`='$pc',
								`d_pic`='$d_img',
								`d_gender`='$dgender',
								`d_language`='$dlang',
								`licence_authority`='$license_authority', 
								`driver_reg_date`='$date' WHERE `d_id`='$d_id'";
	$r = mysqli_query($connect, $sql);
	if($r){    
		echo json_encode(array('message'=>"Profile Update Successfully",'status'=>true));
	}else{    
		echo json_encode(array('message'=>"Error In Updating Profile",'status'=>false));
	}	 
}else{
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>