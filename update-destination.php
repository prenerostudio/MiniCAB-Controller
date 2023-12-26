<?php
require 'config.php';

$des_id = $_POST['des_id'];
$des_name = $_POST['des_name'];
$des_address = $_POST['des_address'];
$des_city = $_POST['des_city'];
$des_code = $_POST['des_code'];
$date = date("Y-m-d H:i:s");

$sql = "UPDATE `destinations` SET  
								`des_name`='$des_name',
								`des_address`='$des_address',
								`des_city`='$des_city',
								`des_code`='$des_code',
								`des_date_added`='$date' WHERE  `des_id`='$des_id'";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: destinations.php');    
	exit();    
} else {		
	header('Location: destinations.php');    
}
$connect->close();
?>
