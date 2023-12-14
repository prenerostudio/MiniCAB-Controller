<?php
include('config.php');
// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
	
	$b_id = $_POST['b_id'];		
	
	//echo $b_id;
	//die;
    $targetDir = "img/bookers/"; // Directory where the logos will be stored
    $targetFile = $targetDir . basename($_FILES["fileToUpload"]["name"]);
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
		//header('Location: bookers.php');
    }

    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 500000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
		//header('Location: bookers.php');
    }

    // Allow certain file formats
    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif") {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
		//header('Location: bookers.php');
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $targetFile)) {
            // If the file has been successfully uploaded, update the database
            $logoName = basename($_FILES["fileToUpload"]["name"]);

            // Perform the database update query here
            // Establish a MySQL connection and execute an UPDATE query to update the logo information in your database
            // Example: 
             $sql = "UPDATE `bookers` SET `b_pic`='$logoName' WHERE `b_id`='$b_id'";
             $result = mysqli_query($connect, $sql);

            echo "The file " . htmlspecialchars(basename($_FILES["fileToUpload"]["name"])) . " has been uploaded.";
			header('Location: bookers.php');
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
}
?>
