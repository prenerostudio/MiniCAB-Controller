<?php

include('config.php');
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if the necessary fields are set
    if (
        isset($_POST['pickup'], $_POST['dropoff'], $_POST['1-4pass'], $_POST['1-4es'], $_POST['5-6pass'], 
        $_POST['7pass'], $_POST['8pass'], $_POST['9pass'], $_POST['10_14pass'], $_POST['15_16pass'])
    ) {
        // Collect form data
        $pickup = $_POST['pickup'];
        $dropoff = $_POST['dropoff'];
        $p1_4 = $_POST['1-4pass'];
        $e1_4 = $_POST['1-4es'];
        $p5_6 = $_POST['5-6pass'];
        $p7 = $_POST['7pass'];
        $p8 = $_POST['8pass'];
        $p9 = $_POST['9pass'];
        $p10_14 = $_POST['10_14pass'];
        $p15_16 = $_POST['15_16pass'];

        // Perform database connection and insert data
        $host = 'localhost';
        $dbname = 'minicab';
        $user = 'root';
        $password = '';

        try {
            $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Construct the SQL query
            $sql = "INSERT INTO `price_postcode`(`pickup`, `dropoff`, `1_4p`, `1_4e`, `5_6p`, `7p`, `8p`, `9p`, `10_14p`, `15_16p`, `date_add_pp`) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

            // Execute the SQL query with the form values
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$pickup, $dropoff, $p1_4, $e1_4, $p5_6, $p7, $p8, $p9, $p10_14, $p15_16]);

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
