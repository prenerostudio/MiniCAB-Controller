<?php
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $c_id = $_POST['c_id'];
    
    $targetDir = "img/bookers/";
    $originalFileName = $_FILES["fileToUpload"]["name"];        
    $uniqueIdentifier = uniqid();
    $uniqueFileName = $uniqueIdentifier . "_" . $originalFileName;
    $targetFile = $targetDir . $uniqueFileName;    
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

	$allowedFormats = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    if (!in_array($imageFileType, $allowedFormats)) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
            $sql = "UPDATE `clients` SET  `c_pic`=? WHERE `c_id`=?";
            $stmt = mysqli_prepare($connect, $sql);
            if ($stmt) {
                mysqli_stmt_bind_param($stmt, "ss", $uniqueFileName, $c_id);
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
	$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Booker Profile Image Updated',											
											'Controller',											
											'Booker Profile Image Has Been Updated by Controller.')";		
	$actr = mysqli_query($connect, $actsql);		
    header('location: view-booker.php?c_id=' . $c_id);
}
?>
