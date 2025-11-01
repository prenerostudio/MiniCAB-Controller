<?php
require_once "../../config.php"; // DB connection

$d_id = intval($_GET['d_id'] ?? 0);

$response = [
    "driver_status" => "offline",
    "coordinates" => [],
    "end_point" => null
];

if ($d_id > 0) {
    // Get driver status
    $driver = $connect->query("SELECT status FROM drivers WHERE d_id = $d_id")->fetch_assoc();
    $response["driver_status"] = $driver["status"] ?? "offline";

    // Get last 50 coordinates (so it's not huge)
    $location_result = $connect->query("
        SELECT latitude, longitude 
        FROM driver_location 
        WHERE d_id = $d_id 
        ORDER BY time ASC LIMIT 50
    ");

    $coordinates = [];
    while ($row = $location_result->fetch_assoc()) {
        $coordinates[] = [
            "lat" => floatval($row["latitude"]),
            "lng" => floatval($row["longitude"])
        ];
    }

    $response["coordinates"] = $coordinates;
    $response["end_point"] = end($coordinates);
}

header("Content-Type: application/json");
echo json_encode($response);
?>