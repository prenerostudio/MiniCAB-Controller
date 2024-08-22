<?php
if (isset($_POST['timezone'])) {
    $userTimeZone = $_POST['timezone'];
    date_default_timezone_set($userTimeZone);
} else {
    // Fallback to a default time zone if none is provided
    date_default_timezone_set('Europe/London');
}

// Database connection and other configurations
?>
