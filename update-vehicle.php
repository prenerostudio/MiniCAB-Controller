<?php
include("config.php"); 
if ($_SERVER["REQUEST_METHOD"] == "POST") {    
	
   
	$v_id = $_POST["v_id"];
	$vname = $_POST["vname"];	
	$vseat = $_POST["vseat"];
	$vchair = $_POST["vchair"];
	$vbaby = $_POST["vbaby"];
	$vbags = $_POST["vbags"];
	$vtrailer = $_POST["vtrailer"];
	$vbooster = $_POST["vbooster"];
	$vpricing = $_POST["vpricing"];
	$date = date("Y-m-d h:i:s");

	$sql = "UPDATE `vehicles` SET 
								`v_name`='$vname',
								`v_seat`='$vseat',
								`v_bags`='$vbags',
								`v_wchair`='$vchair',
								`v_trailer`='$vtrailer',
								`v_booster`='$vbooster',
								`v_baby`='$vbaby',
								`v_pricing`='$vpricing',
								`date_added`='$date' WHERE `v_id`='$v_id'";
    
	if (mysqli_query($connect, $sql)) {
		
		echo "Bid added successfully!";
		header('location: vehicle.php');
	} else {
		echo "Error: " . mysqli_error($connect);
		//header('location: add-bid.php');
	}
	mysqli_close($connect); 
}
?>
