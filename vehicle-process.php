<?php
require 'config.php';
include('session.php');

function uploadImage() {    
	$targetDir = "img/vehicles/";   
	$targetFilePath = $targetDir . basename($_FILES["v_img"]["name"]);   
	$fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));   
	$allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
	
	// Check if the file type is allowed
	if (in_array($fileType, $allowTypes)) {       
		// Check if the file was uploaded successfully
		if (move_uploaded_file($_FILES["v_img"]["tmp_name"], $targetFilePath)) {           
			return basename($_FILES["v_img"]["name"]); 
		} else {          
			return false;      
		}   
	}   
	return false;
}

// Fetch form data
$vname = $_POST['vname'];
$seats = $_POST['seats'];
$bags = isset($_POST['bags']) ? 1 : 0;
$wchair = isset($_POST['wchair']) ? 1 : 0;
$babyc = isset($_POST['babyc']) ? 1 : 0;

// Upload image if provided
$v_img = uploadImage();

if ($v_img !== false) {
	// Insert with image
	$sql = "INSERT INTO `vehicles`(`v_name`, `v_seat`, `v_airbags`, `v_wchair`, `v_babyseat`, `v_img`) 
	        VALUES (?, ?, ?, ?, ?, ?)";    
	$stmt = $connect->prepare($sql);	
	$stmt->bind_param("siiiis", $vname, $seats, $bags, $wchair, $babyc, $v_img);  
} else {
	// Insert without image
	$sql = "INSERT INTO `vehicles`(`v_name`, `v_seat`, `v_airbags`, `v_wchair`, `v_babyseat`) 
	        VALUES (?, ?, ?, ?, ?)";    
	$stmt = $connect->prepare($sql);	
	$stmt->bind_param("siiii", $vname, $seats, $bags, $wchair, $babyc);   
}

// Execute the statement
if ($stmt->execute()) {   		
	$activity_type = 'New Vehicle Added';			
	$user_type = 'user';			
	$details = "New Vehicle Has Been added by Controller.";			
	$actsql = "INSERT INTO `activity_log`(
					`activity_type`, 
					`user_type`, 
					`user_id`, 
					`details`
				) VALUES (
					'$activity_type',
					'$user_type',
					'$myId',
					'$details')";
	
	$actr = mysqli_query($connect, $actsql);	       
	header('Location: vehicles.php');      	
	exit();   	
} else {               
	echo 'Error: ' . $stmt->error;  
}    

// Close the statement and connection
$stmt->close();
$connect->close();
?>
