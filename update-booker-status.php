<?php
include('config.php');
	
$b_id = $_GET['b_id'];
$status = 1;
$date = date("Y-m-d H:i:s");
	
$sql = "UPDATE `bookers` SET `acount_status`='$status',`booker_reg_date`='$date' WHERE `b_id`='$b_id'";
$result = $connect->query($sql);

if($result){ 
	echo'<br>'; 	
	echo ' '; 	
	echo "<script>alert('Booker has been Updates from the record')</script>";	
	  header('location: view-booker.php?b_id='.$b_id);	
} else {	
	echo "<script>alert('Some error occurred. Try again')</script>";	
	  header('location: view-booker.php?b_id='.$b_id);
}
?>