<?php
include('../../configuration.php');
include('../../session.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $com_id = $_POST['com_id'];
    $targetDir = "../../img/companies/";
    if (!isset($_FILES['fileToUpload'])) {
        echo 'No file selected';
        exit;
    }
    $imageFileType = strtolower(pathinfo($_FILES["fileToUpload"]["name"], PATHINFO_EXTENSION));
    $allowedExtensions = ['jpg','jpeg','png','gif','bmp','pdf','tiff','webp','raw','svg','heif','apng','cr2','ico','jp2','avif'];
    if (!in_array($imageFileType, $allowedExtensions)) {
        echo 'Invalid file type';
        exit;
    }
    $uniqueFilename = uniqid() . '_' . time() . '.' . $imageFileType;
    $targetFile = $targetDir . $uniqueFilename;
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
        $sql = "UPDATE companies SET com_pic='$uniqueFilename' WHERE com_id='$com_id'";
        $result = mysqli_query($connect, $sql);
        if ($result) {
            $activity_type = 'Company Profile Image Update';
            $user_type = 'user';
            $details = "Company Profile Image $com_id Has Been Updated by Controller.";
            $actsql = "INSERT INTO activity_log (activity_type, user_type, user_id, details) VALUES ('$activity_type', '$user_type', '$myId', '$details')";
            mysqli_query($connect, $actsql);
            echo 'success';
        } else {
            echo 'Database update failed';
        }
    } else {
        echo 'File upload failed';
    }
}
?>