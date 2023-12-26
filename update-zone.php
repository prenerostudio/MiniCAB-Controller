<?php
require 'config.php';

$zone_id = $_POST['zone_id'];
$sp = $_POST['sp'];
$ep = $_POST['ep'];
$dis = $_POST['dis'];
$fare = $_POST['fare'];
$date = date("Y-m-d H:i:s");

$sql = "UPDATE `zones` SET  
						`starting_point`='$sp',
						`end_point`='$ep',
						`distance`='$dis',
						`fare`='$fare',
						`zone_date`='$date' WHERE `zone_id`='$zone_id'";                
$result = mysqli_query($connect, $sql);       
if ($result) {         
	header('Location: zones.php');    
	exit();    
} else {		
	header('Location: zones.php');    
}
$connect->close();
?>
