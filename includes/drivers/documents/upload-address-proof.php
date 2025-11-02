<?php
include('../../../configuration.php');
include('../../../session.php');

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $d_id = $_POST['d_id'];
    $targetDir = "../../../img/drivers/address-proof/";

    $fileExtension1 = strtolower(pathinfo($_FILES["pa1"]["name"], PATHINFO_EXTENSION));
    $fileExtension2 = strtolower(pathinfo($_FILES["pa2"]["name"], PATHINFO_EXTENSION));

    $allowTypes = array('jpg','png','jpeg','gif','bmp','pdf','tiff','webp','raw','svg','heif','apng','cr2','ico','jpeg2000','avif');
    $date_update = date('Y-m-d H:i:s');

    if (in_array($fileExtension1, $allowTypes) && in_array($fileExtension2, $allowTypes)) {
        $pa1 = uniqid("pa1_") . "." . $fileExtension1;
        $pa2 = uniqid("pa2_") . "." . $fileExtension2;
        $targetFilePath1 = $targetDir . $pa1;
        $targetFilePath2 = $targetDir . $pa2;

        if (move_uploaded_file($_FILES["pa1"]["tmp_name"], $targetFilePath1) &&
            move_uploaded_file($_FILES["pa2"]["tmp_name"], $targetFilePath2)) {

            // Check if record exists
            $stmt = $connect->prepare("SELECT * FROM address_proofs WHERE d_id = ?");
            $stmt->bind_param("s", $d_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $update = $connect->prepare("UPDATE address_proofs SET ap_1=?, ap_2=?, ap_updated_at=? WHERE d_id=?");
                $update->bind_param("ssss", $pa1, $pa2, $date_update, $d_id);
                $update->execute();
            } else {
                $insert = $connect->prepare("INSERT INTO address_proofs (d_id, ap_1, ap_2, ap_created_at) VALUES (?, ?, ?, ?)");
                $insert->bind_param("ssss", $d_id, $pa1, $pa2, $date_update);
                $insert->execute();
            }

            echo json_encode([
                'status' => 'success',
                'message' => 'Proof of Address uploaded successfully.',
                'ap_1' => 'img/drivers/address-proof/' . $pa1,
                'ap_2' => 'img/drivers/address-proof/' . $pa2
            ]);
            exit;
        } else {
            echo json_encode(['status' => 'error', 'message' => 'File upload failed.']);
            exit;
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Invalid file type.']);
        exit;
    }
}
?>
