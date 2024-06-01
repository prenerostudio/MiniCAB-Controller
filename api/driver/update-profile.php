<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

function uploadImage() {
    $targetDir = "../../img/drivers/";
    $originalFileName = $_FILES["d_img"]["name"];
    $fileType = strtolower(pathinfo($originalFileName, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    $uniqueID = uniqid();
    $dn_img = $uniqueID . '_' . $originalFileName;
    $targetFilePath = $targetDir . $dn_img;
    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["d_img"]["tmp_name"], $targetFilePath)) {
            return $dn_img;
        } else {
            return false;
        }
    }
    return false;
}


// Check if all required fields are set
if(isset($_POST['d_id'], $_POST['dname'], $_POST['demail'], $_POST['d_address'], $_POST['dgender'], $_POST['dlang'])) {
    $d_id = $_POST['d_id'];
    $dname = $_POST['dname'];
    $demail = $_POST['demail'];
    $d_address = $_POST['d_address'];
    $dgender = $_POST['dgender'];
    $dlang = $_POST['dlang'];

    // Handle image upload
    $d_img = uploadImage();

    if ($d_img !== false) {
        $sql = "UPDATE `drivers` SET 
                                    `d_name`='$dname',
                                    `d_email`='$demail',
                                    `d_address`='$d_address',
                                    `d_pic`='$d_img',
                                    `d_gender`='$dgender',
                                    `d_language`='$dlang' WHERE `d_id`='$d_id'";

        $r = mysqli_query($connect, $sql);
        if ($r) {    
            echo json_encode(array('message' => "Profile Updated Successfully", 'status' => true));
        } else {    
            echo json_encode(array('message' => "Error In Updating Profile", 'status' => false));
        }
    } else {
        echo json_encode(array('message' => "Error Uploading Image", 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some Fields are Missing", 'status' => false));
}
?>
