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
        'mot_certificate' => uploadFile($_FILES["mot_certificate"], "../../img/drivers/vehicle/mot-certificate/"),
        'pco' => uploadFile($_FILES["pco"], "../../img/drivers/vehicle/pco/"),
        'insurance' => uploadFile($_FILES["insurance"], "../../img/drivers/vehicle/insurance/"),
        'road_tax' => uploadFile($_FILES["road_tax"], "../../img/drivers/vehicle/road-tax/"),
        'vehicle_picture' => uploadFile($_FILES["vehicle_picture"], "../../img/drivers/vehicle/picture/"),
        'rental_agreement' => uploadFile($_FILES["rental_agreement"], "../../img/drivers/vehicle/rental-agreement/"),
        'insurance_schedule' => uploadFile($_FILES["insurance_schedule"], "../../img/drivers/vehicle/insurance-schedule/"),
        'extra' => uploadFile($_FILES["extra"], "../../img/drivers/vehicle/extra/")
    );

    // Check if any file uploads failed
    if (in_array(false, $uploadedFiles)) {
        echo json_encode(array('message' => "Error in uploading files", 'status' => false));
    } else {
       
            $sql = "UPDATE `vehicle_documents` SET 												
												`log_book`='$uploadedFiles[log_book]',
												`mot_certificate`='$uploadedFiles[mot_certificate]',
												`pco`='$uploadedFiles[pco]',
												`insurance`='$uploadedFiles[insurance]',
												`road_tax`='$uploadedFiles[road_tax]',
												`vehicle_picture`='$uploadedFiles[vehicle_picture]',
												`rental_agreement`='$uploadedFiles[rental_agreement]',
												`insurance_schedule`='$uploadedFiles[insurance_schedule]',
												`extra`='$uploadedFiles[extra]',
												`date_upload`='$date' WHERE `d_id`='$d_id'";
            
            $r = mysqli_query($connect, $sql);
            if ($r) {
                echo json_encode(array('message' => "Documents Updated Successfully", 'status' => true));
            } else {
                echo json_encode(array('message' => "Error In Updating Documents", 'status' => false));
            }
        
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>