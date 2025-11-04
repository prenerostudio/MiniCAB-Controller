<?php
include('../../configuration.php');
include('../../session.php');

header('Content-Type: application/json');

// Fetch recent 10 activities (you can adjust limit)
$query = "SELECT * FROM activity_log ORDER BY log_id DESC LIMIT 6";
$result = mysqli_query($connect, $query);

$notifications = [];

while ($row = mysqli_fetch_assoc($result)) {
    $notifications[] = [
        'log_id' => $row['log_id'],
        'activity_type' => $row['activity_type'],
        'details' => $row['details'],
        'timestamp' => date('d M Y h:i A', strtotime($row['timestamp'])),
        'user_type' => ucfirst($row['user_type'])
    ];
}

echo json_encode($notifications);
?>
