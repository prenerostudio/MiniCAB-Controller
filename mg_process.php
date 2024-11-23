<?php
include('config.php');

$pickup = $_POST['pickup'];
$price = $_POST['price'];

$sql="INSERT INTO `mg_charges`(`pickup_location`, `pickup_charges`) VALUES('$pickup', '$price')";

$result = $connect->query($sql);

if($result){		

    $activity_type = 'Meet & Greet Charges Added';    

    $user = 'Controller';    

    $details = 'New Meet & Greet Charges have been added by Controller.';
                

    $actsql = "INSERT INTO `activity_log` (`activity_type`, `user`, `details`) VALUES ($activity_type, $user, $details)";    

    $actstmt = $connect->query($actsql)    ;
	
		

    header('location: pricing.php');
}else{

    echo 'error';
}

?>