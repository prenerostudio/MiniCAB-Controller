<?php
require 'config.php';

$c_id = $_POST['c_id'];
$cname = $_POST['cname'];
$cemail = $_POST['cemail'];
$cgender = $_POST['cgender'];
$clang = $_POST['clang'];
$pc = $_POST['postal_code'];
$cni = $_POST['cni'];
$caddress = $_POST['caddress'];
        
$sql = "UPDATE `clients` SET  
							`c_name`='$cname',
							`c_email`='$cemail',														
							`c_address`='$caddress',
							`c_gender`='$cgender',
							`c_language`='$clang',
							`postal_code`='$pc',							
							`c_ni`='$cni' WHERE `c_id`='$c_id'";        
        $result = mysqli_query($connect, $sql);       
        if ($result) {
			$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Customer Profile Updated',											
											'Controller',											
											'Customer " . $c_id . " Has Been Updated by Controller.')";
			$actr = mysqli_query($connect, $actsql);
            header('location: view-customer.php?c_id='.$c_id);
            exit();
        } else {           
			header('location: view-customer.php?c_id='.$c_id);
        }
$connect->close();
?>
