<?php
include('config.php');


$d_id = $_POST['d_id'];
$status = 1;
$date = date("Y-m-d H:i:s");


$sql = "UPDATE `drivers` SET  `acount_status`='$status',`driver_reg_date`='$date' WHERE `d_id`='$d_id'";

$result = mysqli_query($connect, $sql);       
if ($result) {  
	
	header('Location: drivers.php');    
	exit();    
} else {		
	header('Location: drivers.php');    
}
$connect->close();


?>