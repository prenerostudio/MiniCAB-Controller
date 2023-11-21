<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Function to handle image upload
function uploadImage() {
    $targetDir = "img/vehicles/";
    $targetFilePath = $targetDir . basename($_FILES["v_img"]["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');

    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["v_img"]["tmp_name"], $targetFilePath)) {
            return $targetFilePath;
        } else {
            return false;
        }
    }
    return false;
}
$d_id  = $_POST['d_id'];
$v_id = $_POST['v_id'];
$date = date("Y-m-d H:i:s");

// Handle image upload
    $v_img = uploadImage();



if(isset($_POST['vname'])){ 	 	        		
		$sql="INSERT INTO `driver_vehicle`(
													`v_id`, 
													`d_id`, 
													`date_v_add`
													) VALUES (
													'[value-1]',
													'[value-2]',
													'[value-3]',
													'[value-4]')";				
		
		$r=mysqli_query($connect,$sql);
		if($r){    
		
			
			echo json_encode(array('message'=>"Vehicle Added Successfully",'status'=>true));
		}else{    
			echo json_encode(array('message'=>"Error In Adding Vehicle",'status'=>false));
		}	        
}else{
   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>