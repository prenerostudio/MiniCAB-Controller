<?php
require 'config.php';


$company_id = $_POST['company_id'];
$c_name = $_POST['cname'];
$c_phone = $_POST['cphone'];
$c_email = $_POST['cemail'];
$ca_email = $_POST['aemail'];
$ca_phone = $_POST['aphone'];
$c_web = $_POST['cweb'];
$c_licence = $_POST['clicence'];
$c_vat = $_POST['cvat'];
$cr_num = $_POST['cnum'];
$c_tax = $_POST['ctax'];
$c_address = $_POST['caddress'];
$c_zip = $_POST['czip'];
$c_city = $_POST['city'];
$c_country = $_POST['country'];
$c_language = $_POST['clang'];
$c_currency = $_POST['currency'];
$c_tz = $_POST['time_zone'];
$date = date("Y-m-d H:i:s");






$sql = "UPDATE `company` SET  `com_name`='$c_name',
								`com_phone`='$c_phone',
								`com_c_email`='$c_email',
								`com_a_email`='$ca_email',
								`com_a_phone`='$ca_phone',
								`com_web`='$c_web',
								`com_licence`='$c_licence',
								`com_vat`='$c_vat',
								`com_r_num`='$cr_num',
								`com_tax`='$c_tax',
								`com_address`='$c_address',
								`com_zip`='$c_zip',
								`com_city`='$c_city',
								`com_country`='$c_country',
								`com_language`='$c_language',
								`com_currency`='$c_currency',
								`com_time_zone`='$c_tz',
								`com_date_reg`='$date' WHERE `company_id`='$company_id'";
        
        $result = mysqli_query($connect, $sql);
       
        if ($result) {
         
            header('Location: company.php');
            exit();
        } else {
           
			header('Location: company.php');
        }



$connect->close();
?>
