<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id = $_POST['c_id'];
$c_email = $_POST['c_email'];
$date = date("Y-m-d h:i:s");
				
$sql="UPDATE `clients` SET `c_email`='$c_email',`reg_date`='$date' WHERE `c_id`='$c_id'";								

$r=mysqli_query($connect,$sql);		

if($r){    			
	echo json_encode(array('message'=>"Email Address Updated Successfully",'status'=>true));			
}else{    		
	echo json_encode(array('message'=>"Error In Updating Email Address",'status'=>false));			
}				
?>