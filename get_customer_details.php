<?php
include('config.php');
if (isset($_POST['c_id'])) {
    $clientID = $_POST['c_id'];
    $query = "SELECT * FROM clients WHERE c_id = '$clientID'";
    $result = mysqli_query($connect, $query);
    if ($result) {      
        $row = mysqli_fetch_assoc($result);
        $customerPhone = $row['c_phone'];
        $customerEmail = $row['c_email'];        
        $response = array('phone' => $customerPhone, 'email' => $customerEmail);
        echo json_encode($response);
    } else {        
        echo "Error in query: " . mysqli_error($connect);
    }
} else {    
    echo "Client ID not set.";
}
mysqli_close($connect);
?>