<?php
include('config.php');
if(isset($_POST['submit'])) {
	$d_id = $_POST['d_id'];  	    
	$targetDir = "img/drivers/extra/";    
	$fileExtension = strtolower(pathinfo($_FILES["extra"]["name"], PATHINFO_EXTENSION));    
	$allowTypes = array('jpg', 'png', 'jpeg', 'gif');    
	$uniqueId = uniqid();      
	$extra = $uniqueId . "." . $fileExtension;     
	$targetFilePath = $targetDir . $extra;    
	if (in_array($fileExtension, $allowTypes)) {												    
		if (move_uploaded_file($_FILES["extra"]["tmp_name"], $targetFilePath)) {        			            
			$insert = $connect->query("UPDATE `driver_documents` SET `extra`='$extra' WHERE `d_id`='$d_id'");            
			if($insert) {            
				echo "File uploaded successfully.";                
				header('location: view-driver.php?d_id='.$d_id.'#tabs-document');            
			} else {
				echo "Database update failed.";                
				header('location: view-driver.php?d_id='.$d_id.'#tabs-document');            
			}        
		} else {        
			echo "File upload failed, please try again.";            
			header('location: view-driver.php?d_id='.$d_id.'#tabs-document');        
		}    
	} else {
		echo "Invalid file type.";        
		header('location: view-driver.php?d_id='.$d_id.'#tabs-document');    
	}    
}
?>