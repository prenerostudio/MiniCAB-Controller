<?php
require 'config.php';


$d_id = $_POST['d_id'];
$dname = $_POST['dname'];
$demail = $_POST['demail'];
$dphone = $_POST['dphone'];
$dgender = $_POST['dgender'];
$dlang = $_POST['dlang'];
$dv = $_POST['v_id'];
$licence = $_POST['dlicence'];
$lexp = $_POST['lexp'];
$pco = $_POST['pco'];
$pcoexp = $_POST['pcoexp'];
$skype = $_POST['skype'];
$remarks = $_POST['remarks'];
$date = date("Y-m-d H:i:s");





        $sql = "UPDATE `drivers` SET 
									`d_name`='$dname',
									`d_email`='$demail',
									`d_phone`='$dphone',
									`d_gender`='$dgender',
									`d_language`='$dlang',
									`v_id`='$dv',
									`d_licence`='$licence',
									`d_licence_exp`='$lexp',
									`pco_licence`='$pco',
									`pco_exp`='$pcoexp',
									`skype_acount`='$skype',
									`d_remarks`='$remarks',							
									`driver_reg_date`='$date' WHERE `d_id`='$d_id'";
        
        $result = mysqli_query($connect, $sql);
       
        if ($result) {
         
            header('Location: drivers.php');
            exit();
        } else {
           
			header('Location: driver-details.php');
        }



$connect->close();
?>
