<?php
include('../../../config.php');
include('../../../session.php');

if (isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];
    $dvla_num = $_POST['dvla_num'];
    $date_update = date('Y-m-d H:i:s'); // Current timestamp
    $targetDir = "../../../img/drivers/dvla/";

    // Allowed file extensions
    $allowedExtensions = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    // Validate and handle file upload
    $fileExtension = strtolower(pathinfo($_FILES["dvla"]["name"], PATHINFO_EXTENSION));
    if (!in_array($fileExtension, $allowedExtensions)) {
        header("Location: ../../../view-driver.php?d_id=$d_id#tabs-document");
        exit("Invalid file type.");
    }

    // Generate unique filename
    $fileName = uniqid() . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["dvla"]["tmp_name"], $targetFilePath)) {
        try {
            // Check if record exists
            $stmt = $connect->prepare("SELECT * FROM `dvla_check` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                // Update existing record
                $updateStmt = $connect->prepare("UPDATE `dvla_check` SET `dvla_number`= ?, `dvla_img`= ?, `dvla_updated_at`= ? WHERE `d_id` = ?");
                $updateStmt->bind_param("ssss", $dvla_num, $fileName, $date_update, $d_id);

                if (!$updateStmt->execute()) {
                    exit("Database update failed.");
                }

                logActivity('DVLA Check Number Updated', $d_id, "DVLA Check Number of Driver $d_id has been updated by Controller.");
            } else {
                // Insert new record
                $insertStmt = $connect->prepare("INSERT INTO `dvla_check`(`d_id`, `dvla_number`, `dvla_img`, `dvla_created_at`) VALUES (?, ?, ?, ?)");
                $insertStmt->bind_param("ssss", $d_id, $dvla_num, $fileName, $date_update);

                if (!$insertStmt->execute()) {
                    exit("Database insertion failed.");
                }

                logActivity('DVLA Check Number Added', $d_id, "DVLA Check Number of Driver $d_id has been added by Controller.");
            }

            header("Location: ../../../view-driver.php?d_id=$d_id#tabs-document");
        } catch (Exception $e) {
            exit("An error occurred: " . $e->getMessage());
        }
    } else {
        header("Location: ../../../view-driver.php?d_id=$d_id#tabs-document");
        exit("File upload failed, please try again.");
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
