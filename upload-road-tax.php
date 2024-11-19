<?php
include('config.php');
include('session.php');

if (isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];
    $rt_num = $_POST['rt_num'];
    $rt_exp = $_POST['rt_exp'];
    $date_update = date('Y-m-d H:i:s'); // Current timestamp
    $targetDir = "img/drivers/vehicle/road-tax/";

    // Validate file extension
    $fileExtension = strtolower(pathinfo($_FILES["rt"]["name"], PATHINFO_EXTENSION));
    $allowedExtensions = ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif'];

    if (!in_array($fileExtension, $allowedExtensions)) {
        header("Location: view-driver.php?d_id=$d_id#tabs-document");
        exit("Invalid file type.");
    }

    // Generate unique filename and path
    $uniqueId = uniqid();
    $fileName = $uniqueId . "." . $fileExtension;
    $targetFilePath = $targetDir . $fileName;

    // Attempt to upload the file
    if (move_uploaded_file($_FILES["rt"]["tmp_name"], $targetFilePath)) {
        try {
            // Check if record exists
            $stmt = $connect->prepare("SELECT * FROM `vehicle_road_tax` WHERE `d_id` = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                // Update existing record
                $updateStmt = $connect->prepare("UPDATE `vehicle_road_tax` SET `rt_num`= ?,`rt_exp`= ?,`rt_img`= ?,`rt_updated_at`= ? WHERE `d_id` = ?");
                $updateStmt->bind_param("sssss", $rt_num, $rt_exp, $fileName, $date_update, $d_id);

                if ($updateStmt->execute()) {
                    logActivity('Vehicle Road TAX Updated', $d_id, "Vehicle Road TAX of Driver $d_id has been updated by Controller.");
                } else {
                    exit("Database update failed.");
                }
            } else {
                // Insert new record
                $insertStmt = $connect->prepare("INSERT INTO `vehicle_road_tax`(`d_id`, `rt_num`, `rt_exp`, `rt_img`, `rt_created_at`) VALUES (?, ?, ?, ?, ?)");
                $insertStmt->bind_param("sssss", $d_id, $rt_num, $rt_exp, $fileName, $date_update);

                if ($insertStmt->execute()) {
                    logActivity('Vehicle Road TAX Added', $d_id, "Vehicle Road TAX of Driver $d_id has been added by Controller.");
                } else {
                    exit("Database insertion failed.");
                }
            }

            header('location: view-driver.php?d_id='.$d_id.'#tabs-vdocument');
        } catch (Exception $e) {
            exit("An error occurred: " . $e->getMessage());
        }
    } else {
        header('location: view-driver.php?d_id='.$d_id.'#tabs-vdocument');
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

