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

    $allowedExtensions = ['jpg','jpeg','png','gif','bmp','webp','svg','avif','heif'];

    if (!in_array($imageFileType, $allowedExtensions)) {
        echo json_encode(['status'=>'error','message'=>'Invalid file format. Only images are allowed.']);
        exit;
    }

    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
        $sql = "UPDATE `users` SET `user_pic`=? WHERE `user_id`=?";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param('si', $uniqueFilename, $user_id);
        $result = $stmt->execute();

        if ($result) {
            // Log activity
            $activity_type = 'Admin Profile Image Updated';
            $user_type = 'user';
            $details = "Admin Profile Image updated by Controller.";
            $actsql = "INSERT INTO `activity_log`(`activity_type`, `user_type`, `user_id`, `details`)
                       VALUES (?, ?, ?, ?)";
            $actstmt = $connect->prepare($actsql);
            $actstmt->bind_param('ssis', $activity_type, $user_type, $myId, $details);
            $actstmt->execute();

            echo json_encode(['status'=>'success', 'newImage'=>$uniqueFilename]);
        } else {
            echo json_encode(['status'=>'error','message'=>'Failed to update database.']);
        }
    } else {
        echo json_encode(['status'=>'error','message'=>'Error uploading file.']);
    }
}
?>
