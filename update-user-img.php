<?php
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_POST['user_id'];
	
    $targetDir = "img/users/";
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($_FILES["fileToUpload"]["name"], PATHINFO_EXTENSION));    
    $uniqueFilename = uniqid() . '_' . time() . '.' . $imageFileType;
    $targetFile = $targetDir . $uniqueFilename;    
    $allowedExtensions = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    if (!in_array($imageFileType, $allowedExtensions)) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }    
    if ($uploadOk == 1) {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {     
            $logoName = $uniqueFilename;
            $sql = "UPDATE `users` SET `user_pic`='$logoName' WHERE `user_id`='$user_id'";
            $result = mysqli_query($connect, $sql);
            if ($result) {
				$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Admin Profile Image',											
											'Controller',											
											'Admin Profile Image Has Been Updated by Controller.')";	
				$actr = mysqli_query($connect, $actsql);
                echo "The file " . htmlspecialchars($logoName) . " has been uploaded.";
                header('Location: profile-setting.php');
            } else {
                echo "Sorry, there was an error updating your file.";
            }
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
}
?>
