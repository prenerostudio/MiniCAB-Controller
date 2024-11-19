<?php
include('config.php');
include('session.php');

// Check if the form is submitted
if (isset($_POST['submit'])) {
    // Collect form data
    $d_id = $_POST['d_id'];
    $date_update = date('Y-m-d H:i:s'); // Current timestamp
    $targetDir = "img/drivers/vehicle/picture/";

    // Allowed file types
    $allowTypes = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    // Process file extensions
    $fileExtensionFront = strtolower(pathinfo($_FILES["pic1"]["name"], PATHINFO_EXTENSION));
    $fileExtensionBack = strtolower(pathinfo($_FILES["pic2"]["name"], PATHINFO_EXTENSION));

    // Validate file types
    if (!in_array($fileExtensionFront, $allowTypes) || !in_array($fileExtensionBack, $allowTypes)) {
        echo "Invalid file type. Allowed types are: " . implode(", ", $allowTypes);
        header('Location: view-driver.php?d_id=' . $d_id . '#tabs-vdocument');
        exit();
    }

    // Generate unique file names
    $vp_front = uniqid() . "." . $fileExtensionFront;
    $vp_back = uniqid() . "." . $fileExtensionBack;

    // Define file paths
    $targetFilePathFront = $targetDir . $vp_front;
    $targetFilePathBack = $targetDir . $vp_back;

    // Upload files
    if (move_uploaded_file($_FILES["pic1"]["tmp_name"], $targetFilePathFront) && move_uploaded_file($_FILES["pic2"]["tmp_name"], $targetFilePathBack)) {
        try {
            // Check if record exists
            $stmt = $connect->prepare("SELECT * FROM `vehicle_pictures` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                // Update existing record
                $updateStmt = $connect->prepare("UPDATE `vehicle_pictures` SET `vp_front`= ?, `vp_back`= ?, `vp_updated_at`= ? WHERE `d_id` = ?");
                $updateStmt->bind_param("ssss", $vp_front, $vp_back, $date_update, $d_id);

                if (!$updateStmt->execute()) {
                    exit("Database update failed.");
                }
                logActivity('Vehicle Pictures Updated', $d_id, "Vehicle Pictures of Driver $d_id have been updated by Controller.");
            } else {
                // Insert new record
                $insertStmt = $connect->prepare("INSERT INTO `vehicle_pictures`(`d_id`, `vp_front`, `vp_back`, `vp_created_at`) VALUES (?, ?, ?, ?)");
                $insertStmt->bind_param("ssss", $d_id, $vp_front, $vp_back, $date_update);

                if (!$insertStmt->execute()) {
                    exit("Database insertion failed.");
                }
                logActivity('Vehicle Pictures Added', $d_id, "Vehicle Pictures of Driver $d_id have been added by Controller.");
            }

            header('Location: view-driver.php?d_id=' . $d_id . '#tabs-vdocument');
            exit();
        } catch (Exception $e) {
            exit("An error occurred: " . $e->getMessage());
        }
    } else {
        echo "File upload failed, please try again.";
        header('Location: view-driver.php?d_id=' . $d_id . '#tabs-vdocument');
        exit();
    }
}

// Function to log activities
function logActivity($activityType, $driverId, $details)
{
    global $connect, $myId;
    $userType = 'user';
    $activityStmt = $connect->prepare("INSERT INTO `activity_log` (`activity_type`, `user_type`, `user_id`, `details`) VALUES (?, ?, ?, ?)");
    $activityStmt->bind_param("ssss", $activityType, $userType, $myId, $details);
    $activityStmt->execute();
}
?>
