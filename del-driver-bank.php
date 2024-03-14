<?php
include('config.php');

$d_bank_id = $_GET['d_bank_id'];
$d_id = $_GET['d_id'];

$sql = "DELETE FROM `driver_bank_details` WHERE `d_bank_id`='$d_bank_id'";
$result = $connect->query($sql);

if($result){ 
	header('Location: view-driver.php?d_id='.$d_id.'#tabs-bank');   	
} else {		
	header('Location: view-driver.php?d_id='.$d_id.'#tabs-bank');   	
}
?>