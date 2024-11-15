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

    // Get the file extensions of the uploaded files
    $fileExtensionFront = strtolower(pathinfo($_FILES["dl_front"]["name"], PATHINFO_EXTENSION));
    $fileExtensionBack = strtolower(pathinfo($_FILES["dl_back"]["name"], PATHINFO_EXTENSION));

    // Allowed file types
    $allowTypes = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    // Generate unique ID for file names
    $uniqueIdFront = uniqid();
    $uniqueIdBack = uniqid();

    // Define file names for front and back images
    $dl_front = $uniqueIdFront . "." . $fileExtensionFront;
    $dl_back = $uniqueIdBack . "." . $fileExtensionBack;

    // Define file paths
    $targetFilePathFront = $targetDir . $dl_front;
    $targetFilePathBack = $targetDir . $dl_back;

    // Check if both uploaded file types are allowed
    if (in_array($fileExtensionFront, $allowTypes) && in_array($fileExtensionBack, $allowTypes)) {
        
        // Attempt to upload the front file
        if (move_uploaded_file($_FILES["dl_front"]["tmp_name"], $targetFilePathFront)) {
            
            // Attempt to upload the back file
            if (move_uploaded_file($_FILES["dl_back"]["tmp_name"], $targetFilePathBack)) {
                
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
                // Back file upload failed
                echo "Back file upload failed, please try again.";
                header('Location: view-driver.php?d_id=' . $d_id . '#tabs-document');
                exit();
            }
        } else {
            // Front file upload failed
            echo "Front file upload failed, please try again.";
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
