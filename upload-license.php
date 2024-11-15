<?php
include('config.php');
include('session.php');

// Check if the form is submitted
if (isset($_POST['submit'])) {
    // Collect form data
    $d_id = $_POST['d_id'];
    $dl_num = $_POST['licene_number'];
    $dl_expy = $_POST['licence_exp'];

    // Define target directory for file upload
    $targetDir = "img/drivers/driving-license/";

    // Get the file extension of the uploaded file
    $fileExtension = strtolower(pathinfo($_FILES["dl_front"]["name"], PATHINFO_EXTENSION));

    // Allowed file types
    $allowTypes = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    // Generate unique ID for file names
    $uniqueId = uniqid();

    // Define file names for front and back images
    $dl_front = $uniqueId . "." . $fileExtension;
    $dl_back = uniqid() . "." . $fileExtension;

    // Define file paths
    $targetFilePath = $targetDir . $dl_front;
    $targetFilePath1 = $targetDir . $dl_back;

    // Check if the uploaded file type is allowed
    if (in_array($fileExtension, $allowTypes)) {
        // Attempt to upload the front file
        if (move_uploaded_file($_FILES["dl_front"]["tmp_name"], $targetFilePath)) {
            // Insert the data into the database using prepared statements
            $stmt = $connect->prepare("INSERT INTO `driving_license` (`d_id`, `dl_number`, `dl_expiry`, `dl_front`, `dl_back`) VALUES (?, ?, ?, ?, ?)");
            $stmt->bind_param("sssss", $d_id, $dl_num, $dl_expy, $dl_front, $dl_back);

            if ($stmt->execute()) {
                // Log the activity
                $activity_type = 'Driving License Updated';
                $user_type = 'user';
                $details = "Driving License of Driver $d_id has been uploaded by Controller.";
                $actsql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";
                $actstmt = $connect->prepare($actsql);
                $actstmt->bind_param("ssss", $activity_type, $user_type, $myId, $details);
                $actstmt->execute();

                // Redirect to the driver details page
                header('Location: view-driver.php?d_id=' . $d_id . '#tabs-document');
                exit();
            } else {
                // Database update failed
                echo "Database update failed. Please try again.";
                header('Location: view-driver.php?d_id=' . $d_id . '#tabs-document');
                exit();
            }
        } else {
            // File upload failed
            echo "File upload failed, please try again.";
            header('Location: view-driver.php?d_id=' . $d_id . '#tabs-document');
            exit();
        }
    } else {
        // Invalid file type
        echo "Invalid file type. Allowed types are: " . implode(", ", $allowTypes);
        header('Location: view-driver.php?d_id=' . $d_id . '#tabs-document');
        exit();
    }
}
?>
