<?php
require 'config.php';
$r_name = $_POST['r_name'];
$r_address = $_POST['r_address'];


$sql = "INSERT INTO `railway_stations`(
									`rail_name`, 
									`rail_address`
									) VALUES (
									'$r_name',
									'$r_address')"; 

$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: railway_stations.php');    
	exit();    
} else {		
	header('Location: railway_stations.php');    
}
$connect->close();
?>