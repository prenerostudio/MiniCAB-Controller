<?php
include('../../configuration.php');
if (isset($_POST['d_id'])) {
    $DriverId = $_POST['d_id'];
    $query = "SELECT * FROM `drivers` WHERE `d_id`= '$DriverId'";
    $result = mysqli_query($connect, $query);
    if ($result) {     
        $row = mysqli_fetch_assoc($result);
        $driverPhone = $row['d_phone'];
        $driverEmail = $row['d_email'];        
        $response = array('phone' => $driverPhone, 'email' => $driverEmail);
        echo json_encode($response);
    } else {        
        echo "Error in query: " . mysqli_error($connect);
    }
} else {
    echo "driver ID not set.";
}
mysqli_close($connect);
?>