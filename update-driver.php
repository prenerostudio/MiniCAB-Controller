<?php
require 'config.php';

$d_id = $_POST['d_id'];
$dname = $_POST['dname'];
$demail = $_POST['demail'];
$dphone = $_POST['dphone'];
$dgender = $_POST['dgender'];
$daddress = $_POST['daddress'];
$dauth = $_POST['dauth'];
$dl = $_POST['dl'];
$dle = $_POST['dle'];
$pl = $_POST['pl'];
$ple = $_POST['ple'];
$dlang = $_POST['dlang'];
$v_id = $_POST['v_id'];
$sa = $_POST['sa'];
$dr = $_POST['dr'];
$date = date("Y-m-d H:i:s");


$sql = "UPDATE `drivers` SET  
							`d_name`='$dname',
							`d_email`='$demail',
							`d_phone`='$dphone',
							`d_address`='$daddress',
							`d_gender`='$dgender',
							`d_language`='$dlang',
							`licence_authority`='$dauth',
							`v_id`='$v_id',
							`d_licence`='$dl',
							`d_licence_exp`='$dle',
							`pco_licence`='$pl',
							`pco_exp`='$ple',
							`skype_acount`='$sa',
							`d_remarks`='$dr',
							`driver_reg_date`='$date' WHERE `d_id`='$d_id'";
        
        $result = mysqli_query($connect, $sql);
       
        if ($result) {
         
            header('Location: view-driver.php?d_id='.$d_id);
            exit();
        } else {
           
			header('Location: view-driver.php?d_id='.$d_id);
        }



$connect->close();
?>
