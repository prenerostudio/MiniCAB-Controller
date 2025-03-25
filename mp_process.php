<?php
require_once('config.php');
require_once('session.php');

$from = $_POST['from'];
$to = $_POST['to'];
$salon = $_POST['salon'];
$estate = $_POST['estate'];
$mpv = $_POST['mpv'];
$esalon = $_POST['esalon'];
$lmpv = $_POST['lmpv'];
$empv = $_POST['empv'];
$minibus = $_POST['minibus'];
$delivery = $_POST['delivery'];
$sql = "INSERT INTO `price_mile`(
							`start_from`, 
							`end_to`, 
							`saloon`, 
							`estate`, 
							`mpv`, 
							`esaloon`, 
							`lmpv`, 
							`empv`, 
							`minibus`, 
							`delivery`
							) VALUES (
							'$from',
							'$to',
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