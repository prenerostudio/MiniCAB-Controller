<?php

include('config.php');
// Check if form is submitted
if(isset($_POST['submit'])) {
	$d_id = $_POST['d_id'];
	 // Process the uploaded image
    $image = $_FILES['image']['tmp_name'];
    $imgContent = addslashes(file_get_contents($image));
	
	
	$check = $connect->query("SELECT * FROM `driver_documents` WHERE `d_id`='$d_id'");
   
	
	if($check){
	$update = $connect->query("UPDATE `driver_documents` SET  `dl_front`='$image'  WHERE `d_id`='$d_id'");	
		// $insert = $connect->query("INSERT into images (image) VALUES ('$imgContent')");
    
    if($update) {
        echo "File uploaded successfully.";
		header('driver-documents.php');
    } else {
        echo "File upload failed, please try again.";
    }
		
	}else{
    // Insert image data into database
    $insert = $connect->query("INSERT INTO `driver_documents`(`d_id`, `dl_front`, `upload_date`) VALUES ('$d_id','$image','$date')");
    
    if($insert) {
        echo "File uploaded successfully.";
    } else {
        echo "File upload failed, please try again.";
    }
		}
}
?>
