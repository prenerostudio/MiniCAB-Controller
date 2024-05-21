<?php
include('config.php');

$special_date = $_POST['mdate'];
$event_name  = $_POST['ename'];
$percent_increment  = $_POST['inc'];

$sql = "INSERT INTO `special_dates`( 
									`special_date`, 
									`event_name`, 
									`percent_increment`
									) VALUES (
									'$special_date',
									'$event_name',
									'$percent_increment')";                

$result = mysqli_query($connect, $sql);
if ($result) {
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Special Date Added ',											
											'Controller',											
											'Controller has added a Special Date " . $special_date . " for Price Upgradation')";		
	$actr = mysqli_query($connect, $actsql);		
	header('Location: special-dates.php');    
	exit();    
} else {	
	header('Location: special-dates.php');    
}
$connect->close();
?>