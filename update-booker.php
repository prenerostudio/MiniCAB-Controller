<?php
include('config.php');


// Form Data Retrieval
$b_id = $_POST['b_id'];
$bname = $_POST['bname'];
$bemail = $_POST['bemail'];
$bphone = $_POST['bphone'];
$bgender = $_POST['bgender'];
$blang = $_POST['blang'];
$pc = $_POST['pc'];
$bcn = $_POST['bcn'];
$bni = $_POST['bni'];
$others = $_POST['others'];
$baddress = $_POST['baddress'];
$com_percent = $_POST['com_percent'];
$com_fixed = $_POST['com_fixed'];
$date = date("Y-m-d H:i:s");

    // Database Insertion
    $sql = "UPDATE `bookers` SET  `b_name`='$bname',
									`b_email`='$bemail',
									`b_phone`='$bphone',									
									`b_address`='$baddress',
									`b_gender`='$bgender',
									`b_language`='$blang',
									`postal_code`='$pc',
									`company_name`='$bcn',
									`others`='$others',
									`b_ni`='$bni',
									`com_percentage`='$com_percent',
									`com_fixed`='$com_fixed',
									`booker_reg_date`='$date' WHERE `b_id`='$b_id'";

    // Execution of SQL Query
    $r = $connect->query($sql);

    // Redirect based on query result
    if ($r) {
        header('Location: bookers.php');
    } else {
        header('Location: clients.php');
    }

?>