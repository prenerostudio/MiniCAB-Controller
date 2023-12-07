<?php

include('config.php');
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if the necessary fields are set
    if (
        isset($_POST['from'], $_POST['to'], $_POST['1-4p'], $_POST['1-4e'], $_POST['5-6p'], 
        $_POST['7p'], $_POST['8p'], $_POST['9p'], $_POST['10_14p'], $_POST['15_16p'])
    ) {
        // Collect form data
        $from = $_POST['from'];
        $to = $_POST['to'];
        $p1_4 = $_POST['1-4p'];
        $e1_4 = $_POST['1-4e'];
        $p5_6 = $_POST['5-6p'];
        $p7 = $_POST['7p'];
        $p8 = $_POST['8p'];
        $p9 = $_POST['9p'];
        $p10_14 = $_POST['10_14p'];
        $p15_16 = $_POST['15_16p'];

        // Perform database connection and insert data
        $host = 'localhost';
        $dbname = 'minicab';
        $user = 'root';
        $password = '';

        try {
            $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Construct the SQL query
            $sql = "INSERT INTO `price_mile` (`start_from`, `end_to`, `1_4p`, `1_4e`, `5_6p`, `7p`, `8p`, `9p`, `10_14p`, `15_16p`, `date_add_pm`) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

            // Execute the SQL query with the form values
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$from, $to, $p1_4, $e1_4, $p5_6, $p7, $p8, $p9, $p10_14, $p15_16]);

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
