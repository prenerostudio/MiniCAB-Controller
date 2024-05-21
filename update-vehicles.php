<?php
include("config.php"); 
if ($_SERVER["REQUEST_METHOD"] == "POST") { 
	$v_id = $_POST["v_id"];	
	$vname = $_POST["vname"];		
	$vseat = $_POST["vseat"];
	$vchair = $_POST["vchair"];	
	$vbaby = $_POST["vbaby"];	
	$vbags = $_POST["vbags"];	
	$vpricing = $_POST["vpricing"];
		
	$sql = "UPDATE `vehicles` SET 
								`v_name`='$vname',
								`v_seat`='$vseat',
								`v_airbags`='$vbags',
								`v_wchair`='$vchair',								
								`v_babyseat`='$vbaby',
								`v_pricing`='$vpricing' WHERE `v_id`='$v_id'";    	
	if (mysqli_query($connect, $sql)) {			
		$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'New Vehicle Added',											
											'Controller',											
											'New Vehicle " . $vname . " Has Been updated by Controller.')";			
		$actr = mysqli_query($connect, $actsql);						
		echo "Vehicle Updated successfully!";		
		header('location: vehicles.php');	
	} else {	
		echo "Error: " . mysqli_error($connect);			
	}
	mysqli_close($connect); 
}
?>