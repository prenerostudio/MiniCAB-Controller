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

if (isset($_POST['d_id'])) {	
   $d_id = $_POST['d_id'];
    $targetDir = "../../img/drivers/address-proof/";
    $fileExtension = strtolower(pathinfo($_FILES["pa1"]["name"], PATHINFO_EXTENSION));
    $fileExtension1 = strtolower(pathinfo($_FILES["pa2"]["name"], PATHINFO_EXTENSION));    
    $date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS    
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'JPEG', 'BMP', 'PDF', 'TIFF', 'WebP', 'Raw', 'SVG', 'HEIF', 'apng', 'CR2', 'ICO', 'JPEG 2000', 'avif');
    $uniqueId = uniqid();  
    $pa1 = $uniqueId . "." . $fileExtension; 
    $pa2 = $uniqueId . "." . $fileExtension1; 
    $targetFilePath = $targetDir . $pa1;
    $targetFilePath1 = $targetDir . $pa2;    
                // Move uploaded files to target directory
        if (move_uploaded_file($_FILES["pa1"]["tmp_name"], $targetFilePath) &&
            move_uploaded_file($_FILES["pa2"]["tmp_name"], $targetFilePath1)) {

            try {
                // Check if record exists
                $stmt = $connect->prepare("SELECT * FROM `address_proofs` WHERE `d_id` = ?");
                $stmt->bind_param("s", $d_id);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    // Update existing record
                    $updateStmt = $connect->prepare("UPDATE `address_proofs` SET `ap_1`= ?,`ap_2`= ?,`ap_updated_at`= ? WHERE `d_id` = ?");
                    $updateStmt->bind_param("ssss", $pa1, $pa2, $date_update, $d_id);

                    if ($updateStmt->execute()) {
                        logActivity('Address Proofs Updated', 'driver', $d_id, "Address Proofs of Driver $d_id has been updated by Controller.");
                    } else {
                        throw new Exception("Database update failed.");
                    }
                } else {
                    // Insert new record
                    $insertStmt = $connect->prepare("INSERT INTO `address_proofs`(`d_id`, `ap_1`, `ap_2`, `ap_created_at`) VALUES (?, ?, ?, ?)");
                    $insertStmt->bind_param("ssss", $d_id, $pa1, $pa2, $date_update);

                    if ($insertStmt->execute()) {
                        logActivity('Address Proofs Added', 'driver', $d_id, "Address Proofs of Driver $d_id has been added by Controller.");
                    } else {
                        throw new Exception("Database insertion failed.");
                    }
                }

                echo json_encode(['message' => "Address Proofs Upload Successful", 'status' => true]);
            } catch (Exception $e) {
                echo json_encode(['message' => $e->getMessage(), 'status' => false]);
            }
        } else {
            echo json_encode(['message' => "File upload failed, please try again.", 'status' => false]);
        }
   
} else {
    echo json_encode(['message' => "Some fields are missing.", 'status' => false]);
}
?>
