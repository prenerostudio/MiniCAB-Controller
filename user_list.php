<?php
// Include your database connection script
include('config.php');

// Fetch user list from the database
$query = "SELECT * FROM `drivers`";
$result = $connect->query($query);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo '<a href="#" class="nav-link text-start mw-100 p-3" data-user-id="' . $row['d_id'] . '">' . $row['d_name'] . '</a>';
    }
} else {
    echo 'No users found';
}

// Close database connection
$connect->close();
?>
