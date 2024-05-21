<?php	
include("config.php"); 

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
		$actsql = "INSERT INTO `activity_log` (
												`activity_type`,		
												`user`, 
												`details`
												) VALUES (
												'Booking Opens for Bid',
												'Controller',
												'Controller Has Opened a Bid for Booking " . $book_id . "')";
		
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