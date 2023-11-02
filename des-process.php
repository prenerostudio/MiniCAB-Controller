<?php
require 'config.php';


$des_name = $_POST['des_name'];
$des_address = $_POST['des_address'];
$des_city = $_POST['des_city'];
$des_code = $_POST['des_code'];
$date = date("Y-m-d H:i:s");

$sql = "INSERT INTO `destinations`(
									`des_name`, 
									`des_address`, 
									`des_city`, 
									`des_code`, 
									`des_date_added`
									) VALUES (								
									'$des_name',
									'$des_address',
									'$des_city',
									'$des_code',
									'$date')";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: destinations.php');    
	exit();    
} else {		
	header('Location: destinations.php');    
}
$connect->close();
?>
