<?php
include('config.php');
include('session.php');

$pickup = $_POST['pickup'];
$dropoff= $_POST['dropoff'];
$salon = $_POST['salon'];
$estate = $_POST['estate'];
$mpv = $_POST['mpv'];
$esalon = $_POST['esalon'];
$lmpv = $_POST['lmpv'];
$empv = $_POST['empv'];
$minibus = $_POST['minibus'];
$delivery = $_POST['delivery'];
$sql = "INSERT INTO `price_postcode`(
								`pickup`, 
								`dropoff`, 
								`saloon`, 
								`estate`, 
								`mpv`, 
								`esaloon`, 
								`lmpv`, 
								`empv`, 
								`minibus`, 
								`delivery`
								) VALUES (
								'$pickup',
								'$dropoff',
								'$salon',
								'$estate',
								'$mpv',
								'$esalon',
								'$lmpv',
								'$empv',
								'$minibus',
								'$delivery')";
$result = $connect->query($sql);
if($result){
    header('location: pricing.php');
}else{	
    echo 'error';
    header('location: pricing.php');
}
?>