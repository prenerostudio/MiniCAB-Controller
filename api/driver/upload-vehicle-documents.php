<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

function uploadFile($file, $targetDirectory)
{
    $fileType = strtolower(pathinfo($file["name"], PATHINFO_EXTENSION));
    $allowedTypes = array('jpg', 'png', 'jpeg', 'gif');
    if (in_array($fileType, $allowedTypes)) {
        $fileName = uniqid() . '_' . basename($file["name"]);
        $targetFilePath = $targetDirectory . $fileName;
        if (move_uploaded_file($file["tmp_name"], $targetFilePath)) {
            return $fileName;
        }
    }
    return false;
}
if (isset($_POST['d_id'])) {
    $d_id = $_POST['d_id'];
    $date = date("Y-m-d h:i:s");

    // Array to hold uploaded file names
    $uploadedFiles = array(
        'log_book' => uploadFile($_FILES["log_book"], "../../img/drivers/vehicle/log-book/"),
        'mot_certificate' => uploadFile($_FILES["mot_certificate"], "../../img/drivers/vehicle/Vehicle-MOT-Certificate/"),
        'pco' => uploadFile($_FILES["pco"], "../../img/drivers/Vehicle-document/Vehicle-PCO/"),
        'insurance' => uploadFile($_FILES["insurance"], "../../img/drivers/Vehicle-document/Vehicle-Insurance/"),
        'road_tax' => uploadFile($_FILES["road_tax"], "../../img/drivers/Vehicle-document/Vehicle-Road-Tax/"),
        'vehicle_picture' => uploadFile($_FILES["vehicle_picture"], "../../img/drivers/Vehicle-document/Veicle-Picture/"),
        'rental_agreement' => uploadFile($_FILES["rental_agreement"], "../../img/drivers/Vehicle-document/Vehicle-Rental-Agreement/"),
        'insurance_schedule' => uploadFile($_FILES["insurance_schedule"], "../../img/drivers/Vehicle-document/Insurance-Schedule/"),
        'extra' => uploadFile($_FILES["extra"], "../../img/drivers/Vehicle-document/Extra/")
    );

    // Check if any file uploads failed
    if (in_array(false, $uploadedFiles)) {
        echo json_encode(array('message' => "Error in uploading files", 'status' => false));
    } else {
        $checksql = "SELECT * FROM `drivers` WHERE `d_phone`='$d_phone'";
        $checkr = mysqli_query($connect, $checksql);
        $datacheck = mysqli_fetch_all($checkr, MYSQLI_ASSOC);
        if (count($datacheck) > 0) {
            echo json_encode(array('message' => "Document Already Exist! Try to Update Documents", 'status' => false));
        } else {
            $sql = "INSERT INTO `vehicle_documents`(
													`d_id`, 
													`log_book`, 
													`mot_certificate`, 
													`pco`, 
													`insurance`, 
													`road_tax`, 
													`vehicle_picture`, 
													`rental_agreement`, 
													`insurance_schedule`, 
													`extra`, 
													`date_upload`
													) VALUES (
													'$d_id',
													'$uploadedFiles[log_book]',
													'$uploadedFiles[mot_certificate]',
													'$uploadedFiles[pco]',
													'$uploadedFiles[insurance]',
													'$uploadedFiles[road_tax]',
													'$uploadedFiles[vehicle_picture]',
													'$uploadedFiles[rental_agreement]',
													'$uploadedFiles[insurance_schedule]',
													'$uploadedFiles[extra]',
													'$date')";
            
            $r = mysqli_query($connect, $sql);
            if ($r) {
                echo json_encode(array('message' => "Documents Uploaded Successfully", 'status' => true));
            } else {
                echo json_encode(array('message' => "Error In Uploading Documents", 'status' => false));
            }
        }
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>