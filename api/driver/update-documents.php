<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");


function uploadFile($file, $targetDirectory) {
    $targetFilePath = $targetDirectory . basename($file["name"]);
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowedTypes = array('jpg', 'png', 'jpeg', 'gif');
    if (in_array($fileType, $allowedTypes)) {
        if (move_uploaded_file($file["tmp_name"], $targetFilePath)) {
            return $targetFilePath;
        }
    }
    return false;
}
if(isset($_POST['d_id'])) {
    $d_id = $_POST['d_id'];
    $date = date("Y-m-d H:i:s");
   // Array to hold uploaded file paths
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
            // Perform update operation
            $updateQuery = "UPDATE `drivers` SET 
                            `dl_front`='$uploadedFiles[dl_front]',
                            `dl_back`='$uploadedFiles[dl_back]',
                            `national_insurance`='$uploadedFiles[ni]',
                            `basic_disclosure`='$uploadedFiles[bd]',
                            `work_proof`='$uploadedFiles[wp]',
                            `passport`='$uploadedFiles[pass]',
                            `dvla`='$uploadedFiles[dvla]' WHERE `d_id`='$d_id'";
            $updateResult = mysqli_query($connect, $updateQuery);

            if ($updateResult) {
                echo json_encode(array('message' => "Documents uploaded successfully", 'status' => true));
            } else {
                echo json_encode(array('message' => "Error in replacing documents", 'status' => false));
            } 
    }
} else {
    echo json_encode(array('message' => "Some fields are missing", 'status' => false));
}
?>