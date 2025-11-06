<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $c_id = $_POST['c_id'];
    $targetDir = "../../img/bookers/";
    $originalFileName = $_FILES["fileToUpload"]["name"];
    $uniqueIdentifier = uniqid();
    $uniqueFileName = $uniqueIdentifier . "_" . $originalFileName;
    $targetFile = $targetDir . $uniqueFileName;
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    $allowedFormats = array('jpg', 'jpeg', 'png', 'gif', 'webp', 'avif');
    if (!in_array($imageFileType, $allowedFormats)) {
        echo json_encode(["status" => "error", "message" => "Invalid file type."]);
        exit;
    }

    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
        $sql = "UPDATE `clients` SET `c_pic`=? WHERE `c_id`=?";
        $stmt = mysqli_prepare($connect, $sql);
        if ($stmt) {
            mysqli_stmt_bind_param($stmt, "ss", $uniqueFileName, $c_id);
            mysqli_stmt_execute($stmt);
            mysqli_stmt_close($stmt);

            // Log activity
            $activity_type = 'Booker Profile Image Updated';
            $user_type = 'user';
            $details = "Booker Profile Image Has Been Updated by Controller.";
            $actsql = "INSERT INTO `activity_log`(`activity_type`,`user_type`,`user_id`,`details`) VALUES ('$activity_type','$user_type','$myId','$details')";
            mysqli_query($connect, $actsql);

            echo json_encode([
                "status" => "success",
                "message" => "File uploaded successfully.",
                "newImage" => $uniqueFileName
            ]);
        } else {
            echo json_encode(["status" => "error", "message" => "Database update failed."]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "File upload failed."]);
    }
}
?>
