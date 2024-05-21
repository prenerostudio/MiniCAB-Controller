<?php
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $d_id = $_POST['d_id'];				

    $targetDir = "img/drivers/"; 
    $uniqueID = uniqid();    
    $targetFile = $targetDir . $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
	$allowedFileTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    if (!in_array($imageFileType, $allowedFileTypes)) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
       header('Location: view-driver.php?d_id='.$d_id);
    }    
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {          
            $logoName = $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);
            $sql = "UPDATE `drivers` SET  `d_pic`='$logoName' WHERE `d_id`='$d_id'";
            $result = mysqli_query($connect, $sql);
			$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Driver Profile Image Updated',											
											'Controller',											
											'Driver Profile Image " . $d_id . " Has Been updated by Controller.')";
			$actr = mysqli_query($connect, $actsql);
            echo "The file " . htmlspecialchars(basename($_FILES["fileToUpload"]["name"])) . " has been uploaded.";
            header('Location: view-driver.php?d_id='.$d_id);
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
}
?>
