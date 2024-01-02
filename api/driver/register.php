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
if (isset($_POST['d_phone'])) {
    $d_email = $_POST['d_email'];
    $d_phone = $_POST['d_phone'];
    $licence_authority = $_POST['licence_authority'];
    $acount_status = 0;
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
        $checksql = "SELECT * FROM `drivers` WHERE `d_phone`='$d_phone'";
        $checkr = mysqli_query($connect, $checksql);
        $datacheck = mysqli_fetch_all($checkr, MYSQLI_ASSOC);
        if (count($datacheck) > 0) {
            echo json_encode(array('message' => "This User Already Exists! Try to Sign in", 'status' => false));
        } else {
            $sql = "INSERT INTO `drivers`(
                        `d_email`, 
                        `d_phone`, 
                        `licence_authority`, 
                        `dl_front`, 
                        `dl_back`, 
                        `national_insurance`, 
                        `basic_disclosure`, 
                        `work_proof`, 
                        `passport`, 
                        `dvla`, 
                        `acount_status`,
                        `driver_reg_date`
                    ) VALUES (
                        '$d_email',
                        '$d_phone',
                        '$licence_authority',
                        '$uploadedFiles[dl_front]',
                        '$uploadedFiles[dl_back]',
                        '$uploadedFiles[ni]',
                        '$uploadedFiles[bd]',
                        '$uploadedFiles[wp]',
                        '$uploadedFiles[pass]',
                        '$uploadedFiles[dvla]',
                        '$acount_status',
                        '$date')";
            
            $r = mysqli_query($connect, $sql);
            if ($r) {
                echo json_encode(array('message' => "Driver Registered Successfully", 'status' => true));
            } else {
                echo json_encode(array('message' => "Error In Registering Driver", 'status' => false));
            }
        }
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>