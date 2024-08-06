<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, x-Requested-With');
header('Cache-Control: max-age=3600');

include("../../config.php");

// Check if book_id is set
if (isset($_POST['book_id'])) {
    // Use prepared statements to avoid SQL injection
    $book_id = $_POST['book_id'];

    // Prepare and execute the SQL statement
    $sql = "SELECT * FROM `bookings` WHERE `booking_status`='Pending' AND `book_id`=?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("i", $book_id); // assuming book_id is an integer
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if bookings were found
    if ($result->num_rows > 0) {
        $bookings = $result->fetch_all(MYSQLI_ASSOC); // Fetch all results as an associative array
        echo json_encode(array('status' => true, 'message' => "Bookings have been recovered", 'data' => $bookings));
    } else {
        echo json_encode(array('message' => 'No Booking Found', 'status' => false));
    }
} else {
    echo json_encode(array('message' => "Some fields are missing", 'status' => false));
}
?>
