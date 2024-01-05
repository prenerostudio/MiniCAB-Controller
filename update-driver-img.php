<?php
include('config.php');

// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $d_id = $_POST['d_id'];				
    $date = date("Y-m-d H:i:s");

    $targetDir = "img/drivers/"; // Directory where the logos will be stored

    // Generate a unique identifier for the image filename
    $uniqueID = uniqid();
    
    $targetFile = $targetDir . $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Check if the file is an actual image or fake image
    if (isset($_POST["submit"])) {
        $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            echo "File is not an image.";
            $uploadOk = 0;
        }
    }

    // Check if file already exists
    if (file_exists($targetFile)) {
        echo "Sorry, file already exists.";
        $uploadOk = 0;
        header('Location: view-driver.php?d_id='.$d_id);
    }

    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 5000000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
        header('Location: view-driver.php?d_id='.$d_id);
    }

    // Allow certain file formats
    $allowedFileTypes = array("jpg", "jpeg", "png", "gif", "jfif");
    if (!in_array($imageFileType, $allowedFileTypes)) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
       header('Location: view-driver.php?d_id='.$d_id);
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
            // If the file has been successfully uploaded, update the database
            $logoName = $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);

            // Perform the database update query here
            // Ensure proper validation and sanitization of user input
            $sql = "UPDATE `drivers` SET  `d_pic`='$logoName', `driver_reg_date`='$date' WHERE `d_id`='$d_id'";
            $result = mysqli_query($connect, $sql);

            echo "The file " . htmlspecialchars(basename($_FILES["fileToUpload"]["name"])) . " has been uploaded.";
            header('Location: view-driver.php?d_id='.$d_id);
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
}
?>
