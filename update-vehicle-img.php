<?php
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $v_id = $_POST['v_id'];
 
    $targetDir = "img/vehicles/";     
    $uniqueID = uniqid();
    $targetFile = $targetDir . $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
    $allowedFileTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    if (!in_array($imageFileType, $allowedFileTypes)) {
        echo "Error: Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
		header('Location: view-vehicle.php?v_id='.$v_id);
    }
    if ($uploadOk == 0) {
        echo "Error: Your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {           
            $logoName = $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);            
            $sql = "UPDATE `vehicles` SET  `v_img`='$logoName' WHERE `v_id`='$v_id'";
            $result = mysqli_query($connect, $sql);
            echo "Success: The file " . htmlspecialchars(basename($_FILES["fileToUpload"]["name"])) . " has been uploaded.";
            header('Location: view-vehicle.php?v_id='.$v_id);
        } else {
            echo "Error: There was an error uploading your file.";
        }
    }
}
?>
