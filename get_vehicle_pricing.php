<?php
include('config.php');
if (isset($_POST['v_id'])) {
    $vehicleId = $_POST['v_id'];
    $vehicleId = mysqli_real_escape_string($connect, $vehicleId);    
    $query = "SELECT v_pricing FROM vehicles WHERE v_id = $vehicleId";    
    $result = mysqli_query($connect, $query);
    if (!$result) {
        echo json_encode(['success' => false, 'error' => mysqli_error($connect)]);
    } else {
        $row = mysqli_fetch_assoc($result);
        if ($row) {
            echo json_encode(['success' => true, 'price' => $row['v_pricing']]);
        } else {
            echo json_encode(['success' => false, 'error' => 'Vehicle not found']);
        }
    }
} else {
    echo json_encode(['success' => false, 'error' => 'Invalid request']);
}
?>