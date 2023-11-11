<?php
// Replace these values with your actual database credentials


if ($_SERVER['SERVER_NAME'] == 'localhost') {
	$servername = "localhost";
$username = "root";
$password = "";
$dbname = "minicab";
} else { 
	$servername  = "localhost";
	$username = "euroqzwc_prenero";
	$password = "Prenero1102/*";
	$dbname = "euroqzwc_minicaboffice";
}




try {
    // Create connection
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);

    // Set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get driverId from the query parameters
    $driverId = isset($_GET['driverId']) ? $_GET['driverId'] : null;

    if ($driverId) {
        // Fetch driver details from the database based on driverId
        $stmt = $conn->prepare("SELECT * FROM drivers WHERE d_id = :driverId");
        $stmt->bindParam(':driverId', $driverId, PDO::PARAM_INT); // Assuming driverId is an integer, adjust if it's a different type
        $stmt->execute();

        // Fetch the result as an associative array
        $driverDetails = $stmt->fetch(PDO::FETCH_ASSOC);

        // Output the details as JSON (you can customize this based on your needs)
        header('Content-Type: application/json');
        echo json_encode($driverDetails);
    } else {
        // Handle the case where driverId is not provided
        echo 'Driver ID not provided';
    }
} catch (PDOException $e) {
    // Handle database connection errors
    echo 'Connection failed: ' . $e->getMessage();
}
?>
