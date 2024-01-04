<?php
include('config.php');

$special_date = $_POST['mdate'];
$event_name  = $_POST['ename'];
$percent_increment  = $_POST['inc'];
$date = date("Y-m-d H:i:s");

$sql = "INSERT INTO `special_dates`( 
									`special_date`, 
									`event_name`, 
									`percent_increment`, 
									`date_dt_added`
									) VALUES (
									'$special_date',
									'$event_name',
									'$percent_increment',
									'$date')";                

$result = mysqli_query($connect, $sql);       

if ($result) {  
	header('Location: special-dates.php');    
	exit();    
} else {	
	//echo 'error';
	header('Location: special-dates.php');    
}
$connect->close();
?>
