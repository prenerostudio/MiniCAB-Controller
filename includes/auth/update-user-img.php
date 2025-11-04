<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_POST['user_id'];
    $targetDir = "../../img/users/";
    $uploadOk = 1;

    $imageFileType = strtolower(pathinfo($_FILES["fileToUpload"]["name"], PATHINFO_EXTENSION));
    $uniqueFilename = uniqid() . '_' . time() . '.' . $imageFileType;
    $targetFile = $targetDir . $uniqueFilename;

    $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'avif'];

    if (!in_array($imageFileType, $allowedExtensions)) {
        echo json_encode(["status" => "error", "message" => "Only JPG, JPEG, PNG, GIF, and WEBP files are allowed."]);
        exit;
    }

    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
        $sql = "UPDATE `users` SET `user_pic`='$uniqueFilename' WHERE `user_id`='$user_id'";
        $result = mysqli_query($connect, $sql);

        if ($result) {
            // Log activity
            $activity_type = 'Admin Profile Image';
            $user_type = 'user';
            $details = 'Admin Profile Image Has Been Updated by Controller.';
            $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`) 
                       VALUES ('$activity_type','$user_type','$myId','$details')";
            mysqli_query($connect, $actsql);

            echo json_encode(["status" => "success", "message" => "Image uploaded successfully!", "filename" => $uniqueFilename]);
        } else {
            echo json_encode(["status" => "error", "message" => "Database update failed."]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed."]);
    }
}
?>
