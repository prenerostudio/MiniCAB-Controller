<?php
require '../../configuration.php';
include('../../session.php');

function uploadImage() {
    if (!isset($_FILES["v_img"]["name"]) || empty($_FILES["v_img"]["name"])) {
        return false;
    }

    $targetDir = "../../img/vehicles/";
    $fileName = time() . "_" . basename($_FILES["v_img"]["name"]);
    $targetFilePath = $targetDir . $fileName;

    if (move_uploaded_file($_FILES["v_img"]["tmp_name"], $targetFilePath)) {
        return $fileName;
    }
    return false;
}

$vname  = $_POST['vname'];
$seats  = $_POST['seats'];
$bags   = isset($_POST['bags']) ? 1 : 0;
$wchair = isset($_POST['wchair']) ? 1 : 0;
$babyc  = isset($_POST['babyc']) ? 1 : 0;

$v_img = uploadImage();

if ($v_img !== false) {
    $sql = "INSERT INTO vehicles (v_name, v_seat, v_airbags, v_wchair, v_babyseat, v_img)
            VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("siiiis", $vname, $seats, $bags, $wchair, $babyc, $v_img);
} else {
    $sql = "INSERT INTO vehicles (v_name, v_seat, v_airbags, v_wchair, v_babyseat)
            VALUES (?, ?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("siiii", $vname, $seats, $bags, $wchair, $babyc);
}

if ($stmt->execute()) {
    echo "success";
} else {
    echo "error: " . $stmt->error;
}

$stmt->close();
$connect->close();
?>
