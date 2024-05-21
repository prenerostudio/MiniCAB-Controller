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
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Railyway Station Added ',											
											'Controller',											
											'Railyway Station Has Been Added by Controller.')";		
	$actr = mysqli_query($connect, $actsql);
	header('Location: railway_stations.php');    
	exit();    
} else {		
	header('Location: railway_stations.php');    
}
$connect->close();
?>