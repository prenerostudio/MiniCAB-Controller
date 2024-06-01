<?php
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $company_id = $_POST['company_id'];				

    $targetDir = "img/companies/"; 
    $uniqueID = uniqid();    
    $targetFile = $targetDir . $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
	$allowedFileTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    if (!in_array($imageFileType, $allowedFileTypes)) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
       header('Location: company.php');
    }    
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {          
            $logoName = $uniqueID . '_' . basename($_FILES["fileToUpload"]["name"]);
            $sql = "UPDATE `company` SET `com_logo`='$logoName' WHERE `company_id`='$company_id'";
            $result = mysqli_query($connect, $sql);
			$actsql = "INSERT INTO `activity_log` (
											`activity_type`,
											`user`,											
											`details`											
											) VALUES (											
											'Company Logo Updated',											
											'Controller',											
											'Company Logo Has Been updated.')";
			$actr = mysqli_query($connect, $actsql);
            echo "The file " . htmlspecialchars(basename($_FILES["fileToUpload"]["name"])) . " has been uploaded.";
            header('Location: company.php');
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
}
?>
