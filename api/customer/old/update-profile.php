<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authoization, x-Requested-with');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Function to handle image upload and return the image name
function uploadImage() {
    $targetDir = "../../img/clients/";
    $targetFileName = basename($_FILES["c_img"]["name"]);
    $targetFilePath = $targetDir . $targetFileName;
    $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif');
    
    if (in_array($fileType, $allowTypes)) {
        if (move_uploaded_file($_FILES["c_img"]["tmp_name"], $targetFilePath)) {
            return $targetFileName; // Return only the image name
        } else {
            return false;
        }
    }
    return false;
}

$c_id = $_POST['c_id'];
$c_name = $_POST['c_name'];
$c_email = $_POST['c_email'];
$c_address = $_POST['c_address'];
$c_gender = $_POST['c_gender'];
$c_lang = $_POST['c_lang'];
$c_ni = $_POST['c_ni'];
$pc = $_POST['pc'];
$others = $_POST['others'];
$date = date("Y-m-d H:i:s");

// Handle image upload
$c_img = uploadImage();

if (isset($_POST['c_id'])) {
    $sql = "UPDATE `clients` SET 
                                `c_name`='$c_name',
                                `c_email`='$c_email',
                                `c_address`='$c_address',
                                `c_gender`='$c_gender',
                                `c_language`='$c_lang',
                                `c_pic`='$c_img',
                                `postal_code`='$pc',
                                `others`='$others',
                                `c_ni`='$c_ni',
                                `reg_date`='$date' WHERE `c_id`='$c_id'";
    
    $r = mysqli_query($connect, $sql);
    
    if ($r) {
        echo json_encode(array('message' => "Profile Update Successfully", 'status' => true));
    } else {
        echo json_encode(array('message' => "Error In Updating Profile", 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some Fields are missing", 'status' => false));
}
?>
