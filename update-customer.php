<?php
require 'config.php';

$c_id = $_POST['c_id'];
$cname = $_POST['cname'];
$cemail = $_POST['cemail'];
$cphone = $_POST['cphone'];
$cgender = $_POST['cgender'];
$clang = $_POST['clang'];
$pc = $_POST['postal_code'];
$ccn = $_POST['company'];
$cni = $_POST['cni'];
$others = $_POST['others'];
$caddress = $_POST['caddress'];
$date = date("Y-m-d H:i:s");


   
        
$sql = "UPDATE `clients` SET  
							`c_name`='$cname',
							`c_email`='$cemail',
							`c_phone`='$cphone',							
							`c_address`='$caddress',
							`c_gender`='$cgender',
							`c_language`='$clang',
							`postal_code`='$pc',
							`company_name`='$ccn',
							`others`='$others',
							`c_ni`='$cni',
							`reg_date`='$date' WHERE `c_id`='$c_id'";
        
        $result = mysqli_query($connect, $sql);
       
        if ($result) {
         
            header('Location: customers.php');
            exit();
        } else {
           
			header('Location: view-customer.php');
        }


$connect->close();
?>
