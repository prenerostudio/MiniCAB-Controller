<?php
include('config.php');
	$rev_id = $_GET['id'];

	$sql = "DELETE FROM `reviews` WHERE `rev_id`='$rev_id'";
	$result = $connect->query($sql);

	if($result){ 
		echo'<br>'; 
		echo ' '; 
		echo "<script>alert('Review has been deleted from the record')</script>";
		header('location: reviews.php');
	} else {
		echo "<script>alert('Some error occurred. Try again')</script>";
		header('location: reviews.php');
	}
?>