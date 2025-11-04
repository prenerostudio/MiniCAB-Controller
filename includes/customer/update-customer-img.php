<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $c_id = $_POST['c_id'];
    $targetDir = "../../img/customers/";
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($_FILES["fileToUpload"]["name"], PATHINFO_EXTENSION));
    $uniqueFilename = uniqid() . '_' . time() . '.' . $imageFileType;
    $targetFile = $targetDir . $uniqueFilename;

    $allowedExtensions = array('jpg', 'png', 'jpeg', 'gif', 'webp', 'avif');

    if (!in_array($imageFileType, $allowedExtensions)) {
        echo json_encode(['status' => 'error', 'message' => 'Invalid file type.']);
        exit;
    }

    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
        $sql = "UPDATE `clients` SET `c_pic`='$uniqueFilename' WHERE `c_id`='$c_id'";
        $result = mysqli_query($connect, $sql);

        if ($result) {
            $activity_type = 'Customer Profile Image Update';
            $user_type = 'user';
            $details = "Customer Profile Image " . $c_id . " has been updated by Controller.";

            $actsql = "INSERT INTO `activity_log`
                        (`activity_type`, `user_type`, `user_id`, `details`)
                        VALUES ('$activity_type', '$user_type', '$myId', '$details')";
            mysqli_query($connect, $actsql);

            echo json_encode([
                'status' => 'success',
                'message' => 'Customer image updated successfully!',
                'newImage' => $uniqueFilename
            ]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Database update failed.']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Image upload failed.']);
    }
}
?>
