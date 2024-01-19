<?php
include('config.php');
	
$c_id = $_GET['c_id'];
$status = 1;
$date = date("Y-m-d H:i:s");
	
$sql = "UPDATE `clients` SET  `acount_status`='$status',`reg_date`='$date' WHERE `c_id`='$c_id'";
$result = $connect->query($sql);

if($result){ 
	echo'<br>'; 	
	echo ' '; 	
	echo "<script>alert('Booker has been Updates from the record')</script>";	
	  header('location: view-booker.php?c_id='.$c_id);	
} else {	
	echo "<script>alert('Some error occurred. Try again')</script>";	
	  header('location: view-booker.php?c_id='.$c_id);
}
?>