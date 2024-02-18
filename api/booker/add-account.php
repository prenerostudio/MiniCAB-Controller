<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id = $_POST['c_id'];
$acount_title = $_POST['acount_title'];
$acount_number = $_POST['acount_number'];
$bank_name = $_POST['bank_name'];
$date = date("Y-m-d h:i:s");
				
$sql="INSERT INTO `customer_bank_account`(
										`c_id`, 
										`cb_account_title`, 
										`cb_account_number`, 
										`cb_bank_name`, 
										`cb_date_added`
										) VALUES (
										'$c_id',
										'$acount_title',
										'$acount_number',
										'$bank_name',										
										'$date')";								

$r=mysqli_query($connect,$sql);		

if($r){    			
	echo json_encode(array('message'=>"Bank Account Added Successfully",'status'=>true));			
}else{    		
	echo json_encode(array('message'=>"Error In adding Bank Account",'status'=>false));			
}				
?>