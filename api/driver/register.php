<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$d_name = $_POST['d_name'];
$d_email = $_POST['d_email'];
$pass = $_POST['pass'];
$d_phone = $_POST['d_phone'];
$date = date("Y-m-d h:i:s");

if(isset($_POST['d_email'])){ 	 	
	$checksql="SELECT * FROM `drivers` WHERE `d_email`='$d_email'";	
	$checkr=mysqli_query($connect,$checksql);	
	$datacheck=mysqli_fetch_all($checkr,MYSQLI_ASSOC);	
	if(count($datacheck)>0){     		
		echo json_encode(array('message'=>"This User Already Exist! Try to Signin",'status'=>false));	
	}else{
        		
		$sql="INSERT INTO `drivers`(
									`d_name`,
									`d_email`,
									`d_password`,
									`d_phone`,
									`driver_reg_date`
									) VALUES (
									'$d_name',
									'$d_email',
									'$pass',
									'$d_phone',
									'$date')";				
		
		$r=mysqli_query($connect,$sql);
		if($r){    
			echo json_encode(array('message'=>"Driver Registered Successfully",'status'=>true));
		}else{    
			echo json_encode(array('message'=>"Error In Registring Driver",'status'=>false));
		}
	}        
}else{
   
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>