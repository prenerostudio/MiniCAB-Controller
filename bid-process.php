<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {    
	include("config.php"); 
   
	$book_id = $_POST["book_id"];
	$bid_note = $_POST["bid_note"];
	$status = 'Open';
	$date = date("Y-m-d h:i:s");

	$sql = "INSERT INTO `booking_bid`( 
										`book_id`, 
										`bid_note`, 
										`bid_status`, 
										`date_added`
										) VALUES (										
										'$book_id',
										'$bid_note',
										'$status',
										'$date')";
    
	if (mysqli_query($connect, $sql)) {
		
		$bsql = "UPDATE `bookings` SET `booking_status`='On Bid',`date_added`='$date' WHERE `book_id`='$book_id'";
		$result = mysqli_query($connect, $bsql);
		
		echo "Bid added successfully!";
		header('location: bids.php');
	} else {
		echo "Error: " . mysqli_error($connect);
		//header('location: add-bid.php');
	}
	mysqli_close($connect); 
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>
</body>
</html>