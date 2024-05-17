<?php
require 'config.php';

$sp = $_POST['sp'];
$ep = $_POST['ep'];
$dis = $_POST['journey_distance'];
$fare = $_POST['fare'];
$date = date("Y-m-d H:i:s");

$sql = "INSERT INTO `zones`( 
							`starting_point`,							
							`end_point`, 							
							`distance`, 							
							`fare`, 							
							`zone_date`							
							) VALUES (							
							'$sp',							
							'$ep',							
							'$dis',							
							'$fare',							
							'$date')";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: zones.php');    
	exit();    
} else {		
	header('Location: zones.php');    
}
$connect->close();
?>
