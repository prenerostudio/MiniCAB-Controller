<?php
require 'config.php';

$dv_id = $_POST['dv_id'];
$d_id = $_POST['d_id'];
$v_id = $_POST['v_id'];
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
         
$sql = "UPDATE `driver_vehicle` SET 
									`v_id`='$v_id',									
									`v_make`='$make',
									`v_model`='$model',
									`v_color`='$color',
									`v_reg_num`='$reg_num',
									`v_phv`='$phv',
									`v_phv_expiry`='$phv_exp',
									`v_ti`='$taxi_ins',
									`v_ti_expiry`='$taxi_exp',
									`v_mot`='$mot',
									`v_mot_expiry`='$mot_exp',
									`date_v_add`='$date' WHERE `dv_id`='$dv_id'";
         
$result = mysqli_query($connect, $sql);              
if ($result) {                   
	header('Location: view-driver.php?d_id='.$d_id.'#tabs-vehicle');          
	exit();       
} else {           			
	header('Location: view-driver.php?d_id='.$d_id.'#tabs-vehicle');     
}                   
$connect->close();
?>