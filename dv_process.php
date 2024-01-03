<?php
require 'config.php';

$v_id = $_POST['v_id'];
$d_id = $_POST['d_id'];
$make = $_POST['make'];
$model = $_POST['model'];
$color = $_POST['color'];
$reg_num = $_POST['reg_num'];
$phv = $_POST['phv'];
$phv_exp = $_POST['phv_exp'];
$taxi_ins = $_POST['taxi_ins'];
$taxi_exp = $_POST['taxi_exp'];
$mot = $_POST['mot'];
$mot_exp = $_POST['mot_exp'];
$date = date("Y-m-d H:i:s");
         
$sql = "INSERT INTO `driver_vehicle`(
									`v_id`, 
									`d_id`, 
									`v_make`, 
									`v_model`,
									`v_color`, 
									`v_reg_num`,
									`v_phv`, 
									`v_phv_expiry`, 
									`v_ti`,
									`v_ti_expiry`, 
									`v_mot`,
									`v_mot_expiry`,
									`date_v_add`
									) VALUES (
									'$v_id',
									'$d_id',
									'$make',
									'$model',
									'$color',
									'$reg_num',
									'$phv',
									'$phv_exp',
									'$taxi_ins',
									'$taxi_exp',
									'$mot',
									'$mot_exp',
									'$date')";
         
$result = mysqli_query($connect, $sql);              
if ($result) {                   
	header('Location: view-driver.php?d_id='.$d_id.'#tabs-vehicle');          
	exit();       
} else {           			
	header('Location: view-driver.php?d_id='.$d_id.'#tabs-vehicle');     
}                   
$connect->close();
?>
