<?php
include('config.php');
include('session.php');

// Check if the form is submitted
if (isset($_POST['submit'])) {
    // Collect form data
    $d_id = $_POST['d_id'];
    $dl_num = $_POST['licene_number'];
    $dl_expy = $_POST['licence_exp'];
  
	$date_update = date('Y-m-d H:i:s'); // Current timestamp
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
				
				   try {
            // Check if record exists
            $stmt = $connect->prepare("SELECT * FROM `driving_license` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                // Update existing record
                $updateStmt = $connect->prepare("UPDATE `driving_license` SET `dl_number`= ?,`dl_expiry`= ?,`dl_front`= ?,`dl_back`= ?,`dl_updated_at`= ? WHERE `d_id` = ?");
                $updateStmt->bind_param("sssss", $dl_num, $dl_expy, $dl_front, $dl_back, $date_update, $d_id);

                if ($updateStmt->execute()) {
                    logActivity('Driving License Updated', $d_id, "Driving License of Driver $d_id has been updated by Controller.");
                } else {
                    exit("Database update failed.");
                }
            } else {
                // Insert new record
                $insertStmt = $connect->prepare("INSERT INTO `driving_license`(`d_id`, `dl_number`, `dl_expiry`, `dl_front`, `dl_back`, `dl_created_at`)  VALUES (?, ?, ?, ?, ?, ?)");
                $insertStmt->bind_param("ssssss", $d_id, $dl_num, $dl_expy, $dl_front, $dl_back, $date_update);

                if ($insertStmt->execute()) {
                    logActivity('Driving License Added', $d_id, "Driving License of Driver $d_id has been added by Controller.");
                } else {
                    exit("Database insertion failed.");
                }
            }

            header('location: view-driver.php?d_id='.$d_id.'#tabs-document');
        } catch (Exception $e) {
            exit("An error occurred: " . $e->getMessage());
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
