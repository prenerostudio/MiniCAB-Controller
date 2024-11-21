<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Log Activity Function
function logActivity($activity_type, $user_type, $user_id, $details) {
    global $connect; // Use the database connection
    $date_time = date("Y-m-d H:i:s");

    $sql = "INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("ssss", $activity_type, $user_type, $user_id, $details);

    if (!$stmt->execute()) {
        throw new Exception("Failed to log activity: " . $stmt->error);
    }
}

if (isset($_POST['d_id'], $_POST['license_number'], $_POST['licence_exp'], $_FILES['dl_front'], $_FILES['dl_back'])) {	
    // Collect form data
    $d_id = $_POST['d_id'];
    $dl_num = $_POST['license_number'];
    $dl_expy = $_POST['licence_exp'];
    
    $date_update = date('Y-m-d H:i:s'); // Current timestamp

    // Define target directory for file upload
    $targetDir = "../../img/drivers/driving-license/";

    // Get file extensions of the uploaded files
    $fileExtensionFront = strtolower(pathinfo($_FILES["dl_front"]["name"], PATHINFO_EXTENSION));
    $fileExtensionBack = strtolower(pathinfo($_FILES["dl_back"]["name"], PATHINFO_EXTENSION));

    // Allowed file types
    $allowTypes = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    // Validate file types
    if (in_array($fileExtensionFront, $allowTypes) && in_array($fileExtensionBack, $allowTypes)) {
        // Generate unique IDs for file names
        $uniqueIdFront = uniqid();
        $uniqueIdBack = uniqid();

        // Define file names for front and back images
        $dl_front = $uniqueIdFront . "." . $fileExtensionFront;
        $dl_back = $uniqueIdBack . "." . $fileExtensionBack;

        // Define file paths
        $targetFilePathFront = $targetDir . $dl_front;
        $targetFilePathBack = $targetDir . $dl_back;

        // Move uploaded files to target directory
        if (move_uploaded_file($_FILES["dl_front"]["tmp_name"], $targetFilePathFront) &&
            move_uploaded_file($_FILES["dl_back"]["tmp_name"], $targetFilePathBack)) {

            try {
                // Check if record exists
                $stmt = $connect->prepare("SELECT * FROM `driving_license` WHERE `d_id` = ?");
                $stmt->bind_param("s", $d_id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    // Update existing record
                    $updateStmt = $connect->prepare("UPDATE `driving_license` SET `dl_number` = ?, `dl_expiry` = ?, `dl_front` = ?, `dl_back` = ?, `dl_updated_at` = ? WHERE `d_id` = ?");
                    $updateStmt->bind_param("ssssss", $dl_num, $dl_expy, $dl_front, $dl_back, $date_update, $d_id);

                    if ($updateStmt->execute()) {
                        logActivity('Driving License Updated', 'driver', $d_id, "Driving License of Driver $d_id has been updated by Controller.");
                    } else {
                        throw new Exception("Database update failed.");
                    }
                } else {
                    // Insert new record
                    $insertStmt = $connect->prepare("INSERT INTO `driving_license` (`d_id`, `dl_number`, `dl_expiry`, `dl_front`, `dl_back`, `dl_created_at`) VALUES (?, ?, ?, ?, ?, ?)");
                    $insertStmt->bind_param("ssssss", $d_id, $dl_num, $dl_expy, $dl_front, $dl_back, $date_update);

                    if ($insertStmt->execute()) {
                        logActivity('Driving License Added', 'driver', $d_id, "Driving License of Driver $d_id has been added by Controller.");
                    } else {
                        throw new Exception("Database insertion failed.");
                    }
                }

                echo json_encode(['message' => "License Upload Successful", 'status' => true]);
            } catch (Exception $e) {
                echo json_encode(['message' => $e->getMessage(), 'status' => false]);
            }
        } else {
            echo json_encode(['message' => "File upload failed, please try again.", 'status' => false]);
        }
    } else {
        echo json_encode(['message' => "Invalid file type.", 'status' => false]);
    }
} else {
    echo json_encode(['message' => "Some fields are missing.", 'status' => false]);
}
?>
