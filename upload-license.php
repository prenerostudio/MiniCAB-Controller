<?php
include('config.php');
include('session.php');
if (isset($_POST['submit'])) {   
	$d_id = $_POST['d_id'];    
	$dl_num = $_POST['licene_number'];    
	$dl_expy = $_POST['licence_exp'];  	
	$date_update = date('Y-m-d H:i:s'); // Current timestamp        
	$targetDir = "img/drivers/driving-license/";        
	$fileExtensionFront = strtolower(pathinfo($_FILES["dl_front"]["name"], PATHINFO_EXTENSION));    
	$fileExtensionBack = strtolower(pathinfo($_FILES["dl_back"]["name"], PATHINFO_EXTENSION));        
	$allowTypes = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];        
	$uniqueIdFront = uniqid();    
	$uniqueIdBack = uniqid();       
	$dl_front = $uniqueIdFront . "." . $fileExtensionFront;    
	$dl_back = $uniqueIdBack . "." . $fileExtensionBack;        
	$targetFilePathFront = $targetDir . $dl_front;    
	$targetFilePathBack = $targetDir . $dl_back;        
	if (in_array($fileExtensionFront, $allowTypes) && in_array($fileExtensionBack, $allowTypes)) {                    
		if (move_uploaded_file($_FILES["dl_front"]["tmp_name"], $targetFilePathFront)) {                                
			if (move_uploaded_file($_FILES["dl_back"]["tmp_name"], $targetFilePathBack)) {								  			
				try {            					            				
					$stmt = $connect->prepare("SELECT * FROM `driving_license` WHERE `d_id` = ?");            
					$stmt->bind_param("s", $d_id);            
					$stmt->execute();            
					$result = $stmt->get_result();            
					if ($result->num_rows > 0) {                                
						$updateStmt = $connect->prepare("UPDATE `driving_license` SET `dl_number`= ?,`dl_expiry`= ?,`dl_front`= ?,`dl_back`= ?,`dl_updated_at`= ? WHERE `d_id` = ?");                
						$updateStmt->bind_param("ssssss", $dl_num, $dl_expy, $dl_front, $dl_back, $date_update, $d_id);
						if ($updateStmt->execute()) {                  
							//  logActivity('Driving License Updated', $d_id, "Driving License of Driver $d_id has been updated by Controller.");                
						} else {                    
							exit("Database update failed.");               
						}          
					} else {               						                
						$insertStmt = $connect->prepare("INSERT INTO `driving_license`(`d_id`, `dl_number`, `dl_expiry`, `dl_front`, `dl_back`, `dl_created_at`)  VALUES (?, ?, ?, ?, ?, ?)");               
						$insertStmt->bind_param("ssssss", $d_id, $dl_num, $dl_expy, $dl_front, $dl_back, $date_update);               
						if ($insertStmt->execute()) {                  
							//  logActivity('Driving License Added', $d_id, "Driving License of Driver $d_id has been added by Controller.");              
						} else {                   
							exit("Database insertion failed.");              
						}         
					}           
					header('location: view-driver.php?d_id='.$d_id.'#tabs-document');     
				} catch (Exception $e) {           
					exit("An error occurred: " . $e->getMessage());       
				}           
			} else {               				               
				echo "Back file upload failed, please try again.";               
				header('Location: view-driver.php?d_id=' . $d_id . '#tabs-document');               
				exit();          
			}      
		} else {           			           
			echo "Front file upload failed, please try again.";            
			header('Location: view-driver.php?d_id=' . $d_id . '#tabs-document');           
			exit();      
		}   
	} else {       		     
		echo "Invalid file type. Allowed types are: " . implode(", ", $allowTypes);      
		header('Location: view-driver.php?d_id=' . $d_id . '#tabs-document');       
		exit();
    }
}
?>