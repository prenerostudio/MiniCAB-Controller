<?php
require 'config.php';
$des_name = $_POST['des_name'];
$des_address = $_POST['des_address'];

$sql = "INSERT INTO `destinations`(
									`des_name`, 
									`des_address`
									) VALUES (								
									'$des_name',
									'$des_address')";                
$result = mysqli_query($connect, $sql);       
if ($result) { 
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'New Destination Added',											
											'Controller',											
											'New Destination Has Been Added by Controller.')";		
	$actr = mysqli_query($connect, $actsql);		
	header('Location: destinations.php');    
	exit();    
} else {		
	header('Location: destinations.php');    
}
$connect->close();
?>