<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods:POST');
header('Access-Control-Allow-Headers:Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

$d_id = $_POST['d_id'];
$ts_id = $_POST['ts_id'];

$sql="SELECT time_slots.*
FROM time_slots
JOIN drivers ON time_slots.d_id = drivers.d_id
WHERE time_slots.d_id = '$d_id' 
  AND time_slots.ts_id = '$ts_id' 
  AND time_slots.ts_status <> 4";
$r=mysqli_query($connect,$sql);
if($r){    
	$output=mysqli_fetch_all($r,MYSQLI_ASSOC);    
	echo json_encode(array('data'=>$output,'status'=>true));
}else{    
	echo json_encode(array('message'=>'No Record Found','status'=>false));	
}
?>