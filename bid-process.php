<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {    
	include("config.php"); 
   
	$book_id = $_POST["book_id"];
	$bid_note = $_POST["bid_note"];
	$status = 1;
	$date = date("Y-m-d h:i:s");

	$sql = "UPDATE `bookings` SET 
								`bid_status`='$status',
								`bid_note`='$bid_note' WHERE `book_id`='$book_id'";
    
	if (mysqli_query($connect, $sql)) {
			
		echo "Bid added successfully!";
		header('location: bid-bookings.php');
	} else {
		echo "Error: " . mysqli_error($connect);
		//header('location: add-bid.php');
	}
	mysqli_close($connect); 
}
?>