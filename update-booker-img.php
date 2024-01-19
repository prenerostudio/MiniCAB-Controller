<?php
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $c_id = $_POST['c_id'];
    $date = date("Y-m-d H:i:s");
    $targetDir = "img/bookers/";
    $originalFileName = $_FILES["fileToUpload"]["name"];
    
    // Generate a unique identifier and append it to the original filename
    $uniqueIdentifier = uniqid();
    $uniqueFileName = $uniqueIdentifier . "_" . $originalFileName;
    $targetFile = $targetDir . $uniqueFileName;
    
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Check if the file is an actual image or fake image
    if (!getimagesize($_FILES["fileToUpload"]["tmp_name"])) {
        echo "File is not an image.";
        $uploadOk = 0;
    }

    // Check if file already exists
    if (file_exists($targetFile)) {
        echo "Sorry, a file with the same name already exists.";
        $uploadOk = 0;
    }

    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 5000000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }

    // Allow certain file formats
    $allowedFormats = ["jpg", "jpeg", "png", "gif"];
    if (!in_array($imageFileType, $allowedFormats)) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
            // Perform the database update query using prepared statements
            $sql = "UPDATE `clients` SET  `c_pic`=?, `reg_date`=? WHERE `c_id`=?";
            $stmt = mysqli_prepare($connect, $sql);

            if ($stmt) {
                mysqli_stmt_bind_param($stmt, "sss", $uniqueFileName, $date, $c_id);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_close($stmt);

                echo "The file " . htmlspecialchars($originalFileName) . " has been uploaded with a unique name.";
            } else {
                echo "Sorry, there was an error updating the database.";
            }
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }

    // Redirect to view-booker.php regardless of the outcome
    header('location: view-booker.php?c_id=' . $c_id);
}
?>
