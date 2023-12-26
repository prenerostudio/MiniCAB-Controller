<?php
require 'config.php';
// Function to handle image upload
function uploadImage() {    
	$targetDir = "img/vehicles/";   
	$targetFilePath = $targetDir . basename($_FILES["v_img"]["name"]);   
	$fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));   
	$allowTypes = array('jpg', 'png', 'jpeg', 'gif');   
	if (in_array($fileType, $allowTypes)) {       
		if (move_uploaded_file($_FILES["v_img"]["tmp_name"], $targetFilePath)) {           
			return basename($_FILES["v_img"]["name"]); // Return only the filename     
		} else {          
			return false;      
		}   
	}   
	return false;
}
$vname = $_POST['vname'];
$seats = $_POST['seats'];
$bags = isset($_POST['bags']) ? 1 : 0;
$wchair = isset($_POST['wchair']) ? 1 : 0;
$babyc = isset($_POST['babyc']) ? 1 : 0;
$pricing = $_POST['pricing'];
$date = date("Y-m-d H:i:s");



// Handle image upload
$v_img = uploadImage();

if ($v_img !== false) {
    $sql = "INSERT INTO `vehicles`(`v_name`, `v_seat`, `v_airbags`, `v_wchair`, `v_babyseat`, `v_pricing`, `v_img`, `date_added`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt = $connect->prepare($sql);
   // $stmt->bind_param("siiiiiss", $vname, $seats, $bag, $wchair, $babyc, $pricing, $v_img, $date);

	
	$stmt->bind_param("ssiisiss", $vname, $seats, $bags, $wchair, $babyc, $pricing, $v_img, $date);

    if ($stmt->execute()) {
        // Redirect on successful insertion
        header('Location: vehicles.php');
        exit();
    } else {
        // Handle the error
        // Consider redirecting to an error page or displaying a user-friendly message
        echo 'Error: ' . $stmt->error;
    }

    $stmt->close();
} else {
    // Handle the case where image upload fails
    // Consider redirecting to an error page or displaying a user-friendly message
    echo 'Sorry, there was an error uploading the image.';
}

$connect->close();
?>
