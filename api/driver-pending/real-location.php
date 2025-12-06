<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['d_id'])) {
		$d_id = $_POST['d_id'];
        $latitude = $_POST['latitude'];
        $longitude = $_POST['longitude'];       
        $date = date("Y-m-d h:i:s");       
        $sql = "INSERT INTO `driver_location`(
												`d_id`, 
												`latitude`, 
												`longitude`, 
												`time`
												) VALUES (
												'$d_id',
												'$latitude',
												'$longitude',												
												'$date')";
        $result = mysqli_query($connect, $sql);
        if ($result) {  
			$updatesql="UPDATE `drivers` SET `latitude`='$latitude',`longitude`='$longitude' WHERE `d_id`='$d_id'";
			$uresult = mysqli_query($connect, $updatesql);
            $response = array('message' => "Location Updated Successfully", 'status' => true);
            echo json_encode($response);
        } else {    
            $response = array('message' => "Error In updating Location", 'status' => false);
            echo json_encode($response);
        }
    } else {
        $response = array('message' => "Some Fields are missing", 'status' => false);
        echo json_encode($response);
    }
} else {
    $response = array('message' => "Invalid Request Method", 'status' => false);
    echo json_encode($response);
}
?>