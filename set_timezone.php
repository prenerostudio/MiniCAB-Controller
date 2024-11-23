<?php
if (isset($_POST['timezone'])) {
    $userTimeZone = $_POST['timezone'];
    date_default_timezone_set($userTimeZone);
} else {
    
    date_default_timezone_set('Europe/London');
}

?>
