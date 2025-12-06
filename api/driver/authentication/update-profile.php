<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../../configuration.php");

function uploadImage() {
    if (!isset($_FILES["d_img"]) || $_FILES["d_img"]["error"] !== 0) {
        return null; // No image uploaded
    }

    $targetDir = "../../../img/drivers/";
    $originalFileName = $_FILES["d_img"]["name"];
    $fileType = strtolower(pathinfo($originalFileName, PATHINFO_EXTENSION));
    
    $allowTypes = array('jpg','png','jpeg','gif','bmp','pdf','tiff','webp','raw','svg','heif','apng','cr2','ico','jp2','avif');

    $uniqueID = uniqid();
    $fileName = $uniqueID . '_' . $originalFileName;
    $targetFilePath = $targetDir . $fileName;

    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["d_img"]["tmp_name"], $targetFilePath)) {
            return $fileName;
        }
    }
    return null;
}

if(isset($_POST['d_id'])) {

    $d_id = $_POST['d_id'];
    $d_name = $_POST['d_name'];
    $d_email = $_POST['d_email'];    
    $d_address = $_POST['d_address'];
    $d_post_code = $_POST['d_post_code'];
    $d_gender = $_POST['d_gender'];
    $d_language = $_POST['d_language'];
    $licence_authority = $_POST['licence_authority'];
    $d_whatsapp = $_POST['d_whatsapp'];
    $d_shift = $_POST['d_shift'];
    $d_pco = $_POST['d_pco'];    
    $update = date('Y-m-d H:i:s');

    $d_img = uploadImage();

    // Base Query
    $sql = "UPDATE `drivers` SET 
                `d_name`='$d_name',
                `d_email`='$d_email',
                `d_address`='$d_address',
                `d_post_code`='$d_post_code',
                `d_gender`='$d_gender',
                `d_language`='$d_language',
                `licence_authority`='$licence_authority',
                `d_whatsapp`='$d_whatsapp',
                `d_shift`='$d_shift',
                `d_pco`='$d_pco',
                `driver_update_at`='$update'";

    // Append image column only if a new image is uploaded
    if($d_img !== null){
        $sql .= ", `d_pic`='$d_img'";
    }

    $sql .= " WHERE `d_id`='$d_id'";

    if(mysqli_query($connect, $sql)) {

        $activity_type = "Profile Details updated";
        $user_type = "driver";
        $details = "Driver updated profile details";

        mysqli_query($connect, 
            "INSERT INTO `activity_log`
                (`activity_type`, `user_type`, `user_id`, `details`)
             VALUES
                ('$activity_type','$user_type','$d_id','$details')"
        );

        echo json_encode(array('message' => "Profile Updated Successfully", 'status' => true));
    } else {
        echo json_encode(array('message' => "Error In Updating Profile", 'status' => false));
    }

} else {
    echo json_encode(array('message' => "Required Fields Missing", 'status' => false));
}

?>
