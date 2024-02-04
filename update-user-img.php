<?php
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $c_id = $_POST['c_id'];

    // Directory where the images will be stored
    $targetDir = "img/users/";
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($_FILES["fileToUpload"]["name"], PATHINFO_EXTENSION));

    // Generate a unique filename
    $uniqueFilename = uniqid() . '_' . time() . '.' . $imageFileType;
    $targetFile = $targetDir . $uniqueFilename;

    // Check if file already exists
    if (file_exists($targetFile)) {
        echo "Sorry, file already exists.";
        $uploadOk = 0;
    }

    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 5000000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }

    // Allow only specific file formats
    $allowedExtensions = array("jpg", "jpeg", "png", "gif");
    if (!in_array($imageFileType, $allowedExtensions)) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

    // Proceed if everything is fine
    if ($uploadOk == 1) {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
            // If the file has been successfully uploaded, update the database
            $logoName = $uniqueFilename;

            $sql = "UPDATE `clients` SET `c_pic`='$logoName' WHERE `c_id`='$c_id'";
            $result = mysqli_query($connect, $sql);

            if ($result) {
                echo "The file " . htmlspecialchars($logoName) . " has been uploaded.";
                header('Location: customers.php');
            } else {
                echo "Sorry, there was an error updating your file.";
            }
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
}
?>
