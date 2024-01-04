<?php
include('config.php');
	$b_id = $_GET['b_id'];

	$sql = "UPDATE `bookers` SET  `b_pic`=''  WHERE `b_id`='$b_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Customer Img has been removed from the record')</script>";
		  header('location: view-booker.php?b_id='.$b_id);
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		  header('location: view-booker.php?b_id='.$b_id);
	}
?>