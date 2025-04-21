<?php
include('config.php');
include('session.php');

if(isset($_POST['submit'])) {
    $d_id = $_POST['d_id'];
    $targetDir = "img/drivers/address-proof/";
    
    // File extensions
    $fileExtension = strtolower(pathinfo($_FILES["pa1"]["name"], PATHINFO_EXTENSION));
    $fileExtension1 = strtolower(pathinfo($_FILES["pa2"]["name"], PATHINFO_EXTENSION));    

    // Date and time
    $date_update = date('Y-m-d H:i:s'); // Format: YYYY-MM-DD HH:MM:SS    

    // Allowed file types
    $allowTypes = array('jpg', 'png', 'jpeg', 'gif', 'bmp', 'pdf', 'tiff', 'webp', 'raw', 'svg', 'heif', 'apng', 'cr2', 'ico', 'jpeg2000', 'avif');

    // Generate unique file names
    $pa1 = uniqid("pa1_") . "." . $fileExtension; 
    $pa2 = uniqid("pa2_") . "." . $fileExtension1; 

    // File paths
    $targetFilePath = $targetDir . $pa1;
    $targetFilePath1 = $targetDir . $pa2;    

    // Validate file types
    if (in_array($fileExtension, $allowTypes) && in_array($fileExtension1, $allowTypes)) {
        // Upload first file
        if (move_uploaded_file($_FILES["pa1"]["tmp_name"], $targetFilePath)) {
            // Upload second file
            if (move_uploaded_file($_FILES["pa2"]["tmp_name"], $targetFilePath1)) {
                try {
                    // Check if record exists
                    $stmt = $connect->prepare("SELECT * FROM `address_proofs` WHERE `d_id` = ?");
                    $stmt->bind_param("s", $d_id);
                    $stmt->execute();
                    $result = $stmt->get_result();

                    if ($result->num_rows > 0) {
                        // Update existing record
                        $updateStmt = $connect->prepare("UPDATE `address_proofs` SET `ap_1`= ?, `ap_2`= ?, `ap_updated_at`= ? WHERE `d_id` = ?");
                        $updateStmt->bind_param("ssss", $pa1, $pa2, $date_update, $d_id);
                        if ($updateStmt->execute()) {
                            header("Location: view-driver.php?d_id=$d_id#tabs-document");
                        } else {
                            echo "Database update failed.";
                        }
                    } else {
                        // Insert new record
                        $insertStmt = $connect->prepare("INSERT INTO `address_proofs`(`d_id`, `ap_1`, `ap_2`, `ap_created_at`) VALUES (?, ?, ?, ?)");
                        $insertStmt->bind_param("ssss", $d_id, $pa1, $pa2, $date_update);
                        if ($insertStmt->execute()) {
                            header("Location: view-driver.php?d_id=$d_id#tabs-document");
                        } else {
                            echo "Database insertion failed.";
                        }
                    }
                } catch (Exception $e) {
                    echo "An error occurred: " . $e->getMessage();
                }
            } else {
                echo "Second file upload failed.";
                header('location: view-driver.php?d_id='.$d_id.'#tabs-document');
            }
        } else {
            echo "First file upload failed.";
            header('location: view-driver.php?d_id='.$d_id.'#tabs-document');
        }
    } else {
        echo "Invalid file type.";
        header('location: view-driver.php?d_id='.$d_id.'#tabs-document');
    }
}
?>
