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
        'dl_front' => uploadFile($_FILES["dl_front"], "../../img/drivers/Driving-Licence/"),
        'dl_back' => uploadFile($_FILES["dl_back"], "../../img/drivers/Driving-Licence/"),
        'ni' => uploadFile($_FILES["ni_img"], "../../img/drivers/National-Insurance/"),
        'bd' => uploadFile($_FILES["bd_img"], "../../img/drivers/Basic-Disclosure/"),
        'wp' => uploadFile($_FILES["wp_img"], "../../img/drivers/Work-Proof/"),
        'pass' => uploadFile($_FILES["pass_img"], "../../img/drivers/Passport/"),
        'dvla' => uploadFile($_FILES["dv_img"], "../../img/drivers/DVLA/")
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