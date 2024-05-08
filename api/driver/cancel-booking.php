<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

$job_id = $_POST['job_id'];
$book_id = $_POST['book_id'];

if(isset($_POST['job_id'])){			
	$usql = "UPDATE `bookings` SET  `booking_status`='Pending'  WHERE `book_id`='$book_id'";		
	$ur=mysqli_query($connect,$usql);
			
	if($ur){   				
		$sql = "DELETE FROM `jobs` WHERE `job_id`='$job_id'";		
		$r=mysqli_query($connect,$sql);
						 		
		echo json_encode(array('message'=>'Booking Has Been Cancelled','status'=>true));
	}else{    
		echo json_encode(array('message'=>'No Record Found','status'=>false));
	}
}else{
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>