<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_id = $_POST['d_id'];
$new_pass = $_POST['new_pass'];
$date = date("Y-m-d h:i:s");


if(isset($_POST['d_id'])){ 	 	

	
	$final_pass = md5($new_pass);
			
		
	$sql="UPDATE `drivers` SET 
								`d_password`='$final_pass',
								`reg_date`='$date' WHERE `d_id`='$d_id'";				
		
	$r=mysqli_query($connect,$sql);
		
	if($r){    
		
		echo json_encode(array('message'=>"Password Change Successfully",'status'=>true));
		
	}else{    
		
		echo json_encode(array('message'=>"Error In Changing Password",'status'=>false));
		
	}
	        

}else{
   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));

}
?>