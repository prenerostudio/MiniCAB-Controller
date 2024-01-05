<?php

include('config.php');
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if the necessary fields are set
    if (
        isset($_POST['pickup'], $_POST['price'])
    ) {
        // Collect form data
        $pickup = $_POST['pickup'];
        $price = $_POST['price'];
       

        // Perform database connection and insert data
        $host = 'localhost';
        $dbname = 'minicab';
        $user = 'root';
        $password = '';

        try {
            $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Construct the SQL query
            $sql = "INSERT INTO `mg_charges`(`pickup_location`, `pickup_charges`, `date_add_mg`) 
                    VALUES (?, ?, NOW())";

            // Execute the SQL query with the form values
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$pickup, $price]);

            echo "Data inserted successfully.";
            header("Location: pricing.php"); // Replace with the actual filename or URL of your form page

        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        } finally {
            $pdo = null;
        }
    } else {
        echo "Error: Insufficient data.";
    }
} else {
    // Redirect or handle the case where the form is not submitted
    header("Location: pricing.php"); // Replace with the actual filename or URL of your form page
    exit();
}
?>
