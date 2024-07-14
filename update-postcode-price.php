<?php
// Include configuration and session management files
require_once('config.php');
require_once('session.php');
	
$pp_id = $_POST['pp_id'];	
$pickup = $_POST['pickup'];
$dropoff = $_POST['dropoff'];
$salon = $_POST['salon'];
$estate = $_POST['estate'];
$mpv = $_POST['mpv'];
$esalon = $_POST['esalon'];
$lmpv = $_POST['lmpv'];
$empv = $_POST['empv'];
$minibus = $_POST['minibus'];
$delivery = $_POST['delivery'];
	

// Update query
$sql = "UPDATE `price_postcode` SET 
								`pickup`= '$pickup',
								`dropoff`= '$dropoff',
								`saloon`= '$salon',
								`estate`= '$estate',
								`mpv`= '$mpv',
								`esaloon`= '$esalon',
								`lmpv`= '$lmpv',
								`empv`= '$empv',
								`minibus`= '$minibus',
								`delivery`= '$delivery' WHERE `pp_id`= '$pp_id'";    
$result = $connect->query($sql);

    if ($result) {
        // Redirect to the list page after successful update
        header("Location: pricing.php"); // Replace with appropriate redirect URL
        exit();
    } else {
	echo 'error';
       //header("Location: pricing.php"); // Replace with appropriate redirect URL
        exit();
    }

?>
