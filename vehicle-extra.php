<?php
include('config.php');
include('session.php');

if (isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];
    $date_update = date('Y-m-d H:i:s'); // Current timestamp
    $targetDir = "img/drivers/vehicle/extra/";

    // Allowed file extensions
    $allowedExtensions = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    // Validate and handle file upload
    if (isset($_FILES["vextra"]["name"]) && $_FILES["vextra"]["name"] !== '') {
        $fileExtension = strtolower(pathinfo($_FILES["vextra"]["name"], PATHINFO_EXTENSION));
        
        if (!in_array($fileExtension, $allowedExtensions)) {
            header("Location: view-driver.php?d_id=$d_id#tabs-vdocument");
            exit("Invalid file type.");
        }

        // Generate unique filename
        $fileName = uniqid() . "." . $fileExtension;
        $targetFilePath = $targetDir . $fileName;

        // Attempt to upload the file
        if (move_uploaded_file($_FILES["vextra"]["tmp_name"], $targetFilePath)) {
            try {
                // Check if record exists
                $stmt = $connect->prepare("SELECT * FROM `vehicle_extras` WHERE `d_id` = ?");
                $stmt->bind_param("s", $d_id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    // Update existing record
                    $updateStmt = $connect->prepare("UPDATE `vehicle_extras` SET `ve_img`= ?,`ve_updated_at`= ? WHERE `d_id` = ?");
                    $updateStmt->bind_param("sss", $fileName, $date_update, $d_id);

                    if (!$updateStmt->execute()) {
                        exit("Database update failed.");
                    }

                    logActivity('Driver Extra Document Updated', $d_id, "Driver Extra Document of Driver $d_id has been updated by Controller.");
                } else {
                    // Insert new record
                    $insertStmt = $connect->prepare("INSERT INTO `vehicle_extras`(`d_id`, `ve_img`, `ve_created_at`) VALUES (?, ?, ?)");
                    $insertStmt->bind_param("sss", $d_id, $fileName, $date_update);

                    if (!$insertStmt->execute()) {
                        exit("Database insertion failed.");
                    }

                    logActivity('Driver Extra Document Added', $d_id, "Driver Extra Document of Driver $d_id has been added by Controller.");
                }

                header("Location: view-driver.php?d_id=$d_id#tabs-vdocument");
                exit;
            } catch (Exception $e) {
                exit("An error occurred: " . $e->getMessage());
            }
        } else {
            header("Location: view-driver.php?d_id=$d_id#tabs-vdocument");
            exit("File upload failed, please try again.");
        }
    } else {
        header("Location: view-driver.php?d_id=$d_id#tabs-vdocument");
        exit("No file selected for upload.");
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
