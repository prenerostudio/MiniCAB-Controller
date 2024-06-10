<?php
include('config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['pickup'], $_POST['price'])) {
        $pickup = $_POST['pickup'];
        $price = $_POST['price'];        
        try {
            $sql = "INSERT INTO `mg_charges`(`pickup_location`, `pickup_charges`, `date_add_mg`) VALUES(?, ?, NOW())";
            $stmt = $connect->prepare($sql);
            $stmt->execute([$pickup, $price]);
            
            $activity_type = 'Meet & Greet Charges Added';
            $user = 'Controller';
            $details = 'New Meet & Greet Charges have been added by Controller.';
            
            $actsql = "INSERT INTO `activity_log` (`activity_type`, `user`, `details`) VALUES (?, ?, ?)";
            $actstmt = $connect->prepare($actsql);
            $actstmt->execute([$activity_type, $user, $details]);
            
            echo "Data inserted successfully.";
            header("Location: pricing.php");
            exit();
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    } else {
        echo "Error: Insufficient data.";
    }
} else {
    header("Location: pricing.php");
    exit();
}
?>