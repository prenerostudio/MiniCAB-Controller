<?php
include('config.php');

if (isset($_POST['b_type_id'])) {
    $selectedBookingType = $_POST['b_type_id'];
    $accountTypeCondition = ($selectedBookingType == '3') ? 'AND account_type = 2' : 'AND account_type = 1';
    $query = "SELECT * FROM `clients` WHERE 1 $accountTypeCondition";
    $result = mysqli_query($connect, $query);
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $clientOptions .= '<option value="' . $row['c_id'] . '">' . $row['c_name'] . '</option>';
        }
        echo $clientOptions;
    } else {
        echo '<option value="">Error fetching clients</option>';
    }
} else {
    echo '<option value="">Invalid request</option>';
}
mysqli_close($connect);
?>
