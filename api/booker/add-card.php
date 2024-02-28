<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$c_id = $_POST['c_id'];
$card_name = $_POST['card_name'];
$card_num = $_POST['card_num'];
$expiry = $_POST['expiry'];
$cvv = $_POST['cvv'];
$date = date("Y-m-d h:i:s");

				
		$sql="INSERT INTO `customer_cards`(
										`c_id`, 
										`card_name`,
										`card_number`, 
										`card_expiry`, 
										`card_cvv`, 
										`card_date_add`
										) VALUES (
										'$c_id',
										'$card_name',
										'$card_num',
										'$expiry',
										'$cvv',										
										'$date')";								
		$r=mysqli_query($connect,$sql);		
		if($r){    			
			echo json_encode(array('message'=>"Card Added Successfully",'status'=>true));		
		}else{    		
			echo json_encode(array('message'=>"Error In adding card",'status'=>false));		
		}				
	

?>