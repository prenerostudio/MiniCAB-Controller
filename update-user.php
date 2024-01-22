<?php
require 'config.php';

$c_id = $_POST['c_id'];
$cname = $_POST['cname'];
$cemail = $_POST['cemail'];
$cphone = $_POST['cphone'];
$cgender = $_POST['cgender'];
$clang = $_POST['clang'];
$pc = $_POST['postal_code'];
$cni = $_POST['cni'];
$others = $_POST['cothers'];
$caddress = $_POST['caddress'];
$date = date("Y-m-d H:i:s");


   
        
$sql = "UPDATE `users` SET 
						`user_email`='[value-2]',
						`first_name`='[value-5]',
						`last_name`='[value-6]',
						`user_phone`='[value-7]',
						`designation`='[value-8]',
						`address`='[value-9]',
						`city`='[value-10]',
						`state`='[value-11]',
						`country`='[value-12]',
						`post_code`='[value-13]',
						`nid`='[value-14]',
						`reg_date`='[value-15]' WHERE `user_id`=''";
        
        $result = mysqli_query($connect, $sql);
       
        if ($result) {
         
            header('location: view-customer.php?c_id='.$c_id);
            exit();
        } else {
           
			header('location: view-customer.php?c_id='.$c_id);
        }


$connect->close();
?>
