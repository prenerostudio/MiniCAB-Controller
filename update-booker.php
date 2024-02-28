<?php
require 'config.php';

$b_id = $_POST['b_id'];
$bname = $_POST['bname'];
$bemail = $_POST['bemail'];
$bphone = $_POST['bphone'];
$bgender = $_POST['bgender'];
$baddress = $_POST['baddress'];
$blang = $_POST['blang'];
$pc = $_POST['pc'];
$others = $_POST['bothers'];
$bni = $_POST['bni'];
$com_name = $_POST['com_name'];
$com_type = $_POST['com_type'];
$percent = $_POST['percent'];
$fixed = $_POST['fixed'];
$date = date("Y-m-d H:i:s");


   
        
$sql = "UPDATE `bookers` SET 
							`b_name`='$bname',
							`b_email`='$bemail',
							`b_phone`='$bphone',
							`b_address`='$baddress',
							`b_gender`='$bgender',
							`b_language`='$blang',							
							`postal_code`='$pc',
							`company_name`='$com_name',
							`others`='$others',
							`b_ni`='$bni',
							`commision_type`='$com_type',
							`percent`='$percent',
							`fixed`='$fixed',							
							`booker_reg_date`='$date' WHERE `b_id`='$b_id'";
        
        $result = mysqli_query($connect, $sql);
       
        if ($result) {
         
            header('location: view-booker.php?b_id='.$b_id);
            exit();
        } else {
           
			header('location: view-booker.php?b_id='.$b_id);
        }


$connect->close();
?>