<?php
include('config.php');

// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $v_id = $_POST['v_id'];
    $date = date("Y-m-d H:i:s");

    $targetDir = "img/vehicles/"; // Directory where the logos will be stored

    // Generate a unique identifier for the image filename
    $uniqueID = uniqid();
    $targetFile = $targetDir . $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Check if the file is an actual image
    if (isset($_POST["submit"])) {
        $isValidImage = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
        if (!$isValidImage) {
            echo "Error: File is not a valid image.";
            $uploadOk = 0;
        }
    }

    // Check if file already exists
    if (file_exists($targetFile)) {
        echo "Error: Sorry, file already exists.";
        $uploadOk = 0;
    }

    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 5000000) {
        echo "Error: Sorry, your file is too large.";
        $uploadOk = 0;
    }

    // Allow certain file formats
    $allowedFileTypes = array("jpg", "jpeg", "png", "gif", "jfif");
    if (!in_array($imageFileType, $allowedFileTypes)) {
        echo "Error: Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "Error: Your file was not uploaded.";
    } else {
        // Move the uploaded file and update the database
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
            // If the file has been successfully uploaded, update the database
            $logoName = $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);

            // Perform the database update query here
            // Ensure proper validation and sanitization of user input
            $sql = "UPDATE `vehicles` SET  `v_img`='$logoName',`date_added`='$date' WHERE `v_id`='$v_id'";
            $result = mysqli_query($connect, $sql);

            echo "Success: The file " . htmlspecialchars(basename($_FILES["fileToUpload"]["name"])) . " has been uploaded.";
            header('Location: view-vehicle.php?v_id='.$v_id);
        } else {
            echo "Error: There was an error uploading your file.";
        }
    }
}
?>
