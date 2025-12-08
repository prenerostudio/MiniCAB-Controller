<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

$d_id=$_POST['d_id'];

if(isset($_POST['d_id'])){		
	$sql="SELECT availability_times.*, drivers.* FROM availability_times JOIN drivers ON availability_times.d_id = drivers.d_id WHERE availability_times.d_id = '$d_id' ORDER BY availability_times.added_time DESC";
	$r=mysqli_query($connect,$sql);
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);
	if(count($output)>0){    				    		
		echo json_encode(array('data'=>$output, 'status'=>true, 'message'=>"Bid List Fetch Successfully"));
	}else{    
		echo json_encode(array('message'=>'No Bid is Available','status'=>false));
	}
}else{    
	echo json_encode(array('message'=>"Some Fileds are missing",'status'=>false));
}
?>