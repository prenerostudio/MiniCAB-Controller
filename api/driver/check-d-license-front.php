<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

if(isset($_POST['d_id'])){	    
   $d_id = $_POST['d_id'];

$stmt = $connect->prepare("SELECT `d_license_front` FROM `driver_documents` WHERE `d_id` = ?");
$stmt->bind_param("s", $d_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $output = $result->fetch_all(MYSQLI_ASSOC);
    echo json_encode(array('data' => $output, 'status' => true));
} else {
    echo json_encode(array('message' => 'No Record Found', 'status' => false));
}
$stmt->close();

} else {    
    echo json_encode(array('message' => 'Some Fields are missing', 'status' => false));
}
?>