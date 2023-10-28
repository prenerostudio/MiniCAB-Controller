<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");
// Function to handle image upload
function uploadImage() {
	$targetDir = "img/drivers/";    
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
$dphone = $_POST['dphone'];
$dgender = $_POST['dgender'];
$dlang = $_POST['dlang'];
$dv = $_POST['v_id'];
$licence = $_POST['dlicence'];
$lexp = $_POST['lexp'];
$pco = $_POST['pco'];
$pcoexp = $_POST['pcoexp'];
$skype = $_POST['skype'];
$remarks = $_POST['remarks'];
$date = date("Y-m-d H:i:s");

// Handle image upload
$d_img = uploadImage();

if(isset($_POST['d_id'])){ 	 	        		
		
	$sql = "UPDATE `drivers` SET 
							
							`d_name`='$dname',
							`d_email`='$demail',																
							`d_phone`='$dphone',
							`d_pic`='$d_img',
							`d_gender`='$dgender',
							`d_language`='$dlang',
							`d_licence`='$licence',
							`d_licence_exp`='$lexp',
							`pco_licence`='$pco',
							`pco_exp`='$pcoexp',
							`skype_acount`='$skype',
							`d_remarks`='$remarks',							
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