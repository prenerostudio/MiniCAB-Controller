<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


$d_id  = $_POST['d_id'];
$v_id = $_POST['v_id'];
$date = date("Y-m-d H:i:s");


if(isset($_POST['v_id'])){ 	 
	
		$sql="INSERT INTO `driver_vehicle`(
											`v_id`, 
											`d_id`, 
											`date_v_add`
											) VALUES (
											'$v_id',
											'$d_id',
											'$date')";				
		
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