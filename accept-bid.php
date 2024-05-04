<?php

include('config.php');

$bid_id = $_GET['bid_id'];


$status = 1;


$sql = "UPDATE `bids` SET `bidding_status`='$status' WHERE `bid_id`='$bid_id'";

$result = $connect->query($sql);


if($result){ 	
	
	

	$fsql = "SELECT bids.*, drivers.* FROM bids JOIN drivers ON bids.d_id = drivers.d_id WHERE bids.bid_id = '$bid_id'";
	
	$fetch = mysqli_query($connect, $fsql);
	
	
	$output=$fetch->fetch_assoc();  
	
	$d_name = $output['d_name'];
	
	$book_id = $output['book_id'];
	
	
	
	$bsql = "UPDATE `bookings` SET `bid_status`= 0 WHERE `book_id`='$book_id'";
	
	$br = $connect->query($bsql);
	
	
	
	
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Bid Accepted ',											
											'Controller',											
											'Bid From Driver " . $d_name . " Has Been Accepted by Controller.')";		
						
	
	$actr = mysqli_query($connect, $actsql);		
	header('location: accepted-bids.php');	
} else {	
	header('location: bids-details.php');	
}
?>



?>