<?php	
include("config.php"); 
include('session.php');	

if ($_SERVER["REQUEST_METHOD"] == "POST") {    
	$book_id = $_POST["book_id"];
	$bid_time = $_POST['av_time'];
	$bid_note = $_POST["bid_note"];
	$status = 1;
	
	$sql = "UPDATE `bookings` SET 
								`bid_status`='$status',
								`bid_time`='$bid_time',
								`bid_note`='$bid_note' WHERE `book_id`='$book_id'";

	if (mysqli_query($connect, $sql)) {				
		$activity_type = 'Booking Opens for Bid';			
		$user_type = 'user';        		
		$details = "Controller Has Opened a Bid for Booking " . $book_id . "')";
				
		$actsql = "INSERT INTO `activity_log`(
											`activity_type`, 
											`user_type`, 
											`user_id`, 
											`details`
											) VALUES (
											'$activity_type',
											'$user_type',
											'$myId',
											'$details')";					
		$actr = mysqli_query($connect, $actsql);						
		echo "Bid added successfully!";
		header('location: bid-bookings.php');
	} else {
		echo "Error: " . mysqli_error($connect);
		header('location: bid-bookings.php');
	}	
	mysqli_close($connect); 
}
?>